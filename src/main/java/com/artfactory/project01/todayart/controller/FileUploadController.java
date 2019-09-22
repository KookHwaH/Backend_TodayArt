package com.artfactory.project01.todayart.controller;

import com.artfactory.project01.todayart.entity.File;
import com.artfactory.project01.todayart.service.FileStorageService;
import com.artfactory.project01.todayart.util.UploadFileResponse;
import org.apache.catalina.core.ApplicationContext;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.Resource;
import org.springframework.http.HttpHeaders;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.springframework.web.servlet.support.ServletUriComponentsBuilder;

import javax.servlet.http.HttpServletRequest;
import java.io.IOException;
import java.security.Principal;
import java.util.Arrays;
import java.util.List;
import java.util.stream.Collectors;

@RestController
@RequestMapping("/storage")
public class FileUploadController {

    private static final Logger logger = LoggerFactory.getLogger(FileUploadController.class);

    @Autowired
    private FileStorageService fileStorageService;

    @PostMapping(value = "/file", produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
    public UploadFileResponse uploadFile(@RequestParam("file") MultipartFile file, HttpServletRequest request, Principal principal) {
        File fileEntity = fileStorageService.storeFile(file, request, principal);

        String fileDownloadUri = ServletUriComponentsBuilder.fromCurrentContextPath()
                .path("/storage/files/")
                .path(fileEntity.getFileName())
                .toUriString();

        // header에 accept : application/json 해줘야 함
        return new UploadFileResponse(file.getOriginalFilename(), fileEntity.getFileName(), fileDownloadUri, file.getContentType(), file.getSize(), fileEntity.getFileId());
    }

    @PostMapping(value = "/files")
    public List<UploadFileResponse> uploadFiles(@RequestParam("files") MultipartFile[] files, HttpServletRequest request, Principal principal) {
        return Arrays.asList(files)
                .stream()
                .map(file -> uploadFile(file, request, principal))
                .collect(Collectors.toList());
    }

    @GetMapping("/files/{fileName:.+}")
    public ResponseEntity<Resource> downloadFile(@PathVariable String fileName, HttpServletRequest request) {
        // Load file as Resource
        Resource resource = fileStorageService.loadFileAsResource(fileName);

        // Try to determine file's content type
        String contentType = null;
        try {
            contentType = fileStorageService.retrieveFileContentType(fileName);
        } catch (Exception ex) {
            logger.info("Could not determine file type.");
        }

        // Fallback to the default content type if type could not be determined
        if(contentType == null) {
            contentType = "application/octet-stream";
        }

        return ResponseEntity.ok()
                .contentType(MediaType.parseMediaType(contentType))
                .header(HttpHeaders.CONTENT_DISPOSITION, "attachment; filename=\"" + resource.getFilename() + "\"")
                .body(resource);
    }
}
