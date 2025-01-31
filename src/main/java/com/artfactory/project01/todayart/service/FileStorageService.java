package com.artfactory.project01.todayart.service;

import com.artfactory.project01.todayart.entity.File;
import com.artfactory.project01.todayart.entity.Member;
import com.artfactory.project01.todayart.exception.FileStorageException;
import com.artfactory.project01.todayart.exception.MyFileNotFoundException;
import com.artfactory.project01.todayart.repository.FileRepository;
import com.artfactory.project01.todayart.util.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.Resource;
import org.springframework.core.io.UrlResource;
import org.springframework.stereotype.Service;
import org.springframework.util.StringUtils;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import java.io.IOException;
import java.net.MalformedURLException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.nio.file.StandardCopyOption;
import java.security.Principal;
import java.time.LocalDateTime;

@Service
public class FileStorageService {

    private final Path fileStorageLocation;

    @Autowired
    FileRepository fileRepository;

    @Autowired
    public FileStorageService(FileStorageProperties fileStorageProperties) {
        this.fileStorageLocation = Paths.get(fileStorageProperties.getUploadDir())
                .toAbsolutePath().normalize();

        try {
            Files.createDirectories(this.fileStorageLocation);
        } catch (Exception ex) {
            throw new FileStorageException("Could not create the directory where the uploaded files will be stored.", ex);
        }
    }

    public File storeFile(MultipartFile file, HttpServletRequest request, Principal principal) {
        // Normalize file name
        String fileName = StringUtils.cleanPath(file.getOriginalFilename());

        try {
            // Check if the file's name contains invalid characters
            if(fileName.contains("..")) {
                throw new FileStorageException("Sorry! Filename contains invalid path sequence " + fileName);
            }

            // Move file to the target location
            // 지금은 동시에 동일한 파일명을 가진 파일을 올릴 경우는 처리가 안 될듯??
            Path targetLocation = this.fileStorageLocation.resolve(fileName);
            Files.copy(file.getInputStream(), targetLocation, StandardCopyOption.REPLACE_EXISTING);

            // 파일 명 변경 (동일한 이름을 가진 파일이 들어오더라도 중복되지 않게 하기 위함)
            HashingUtil hashingUtil = new HashingUtil();
            // 동일한 파일이라도 시간에 따라 파일명이 바뀌게 한다.
            String replaceFileName = hashingUtil.sha256Encoding(fileName + LocalDateTime.now());
            Files.move(targetLocation, targetLocation.resolveSibling(replaceFileName));

            // 파일 명 변경 후 DB 매핑작업 진행.
            Member member = (Member) PrincipalUtil.from(principal);
            File fileEntity = new File();
            fileEntity.setFileOriginName(fileName);
            fileEntity.setFileName(replaceFileName);
            fileEntity.setFileSize(file.getSize());
            fileEntity.setFileUploadIp(request.getRemoteAddr());

            // 실제 운용 시 위 코드로 전환 (아래 10001은 테스트용)
            fileEntity.setMemberId(member.getMemberId());

            fileEntity.setFileContentType(file.getContentType());

            return fileRepository.save(fileEntity);


        } catch (IOException ex) {
            throw new FileStorageException("Could not store file " + fileName + ". Please try again!", ex);
        }
    }

    public Resource loadFileAsResource(String fileName) {
        try {
            Path filePath = this.fileStorageLocation.resolve(fileName).normalize();
            Resource resource = new UrlResource(filePath.toUri());
            if(resource.exists()) {
                return resource;
            } else {
                throw new MyFileNotFoundException("File not found " + fileName);
            }
        } catch (MalformedURLException ex) {
            throw new MyFileNotFoundException("File not found " + fileName, ex);
        }
    }

    public String retrieveFileContentType(String fileName) {
        return fileRepository.findByFileName(fileName).getFileContentType();
    }
}