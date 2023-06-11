package com.bezkoder.spring.security.modules.login.controllers;

import java.util.HashSet;
import java.util.Optional;
import java.util.Set;
import java.util.logging.Logger;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.support.ServletUriComponentsBuilder;

import com.bezkoder.spring.security.modules.login.exceptions.others.NotFoundException;
import com.bezkoder.spring.security.modules.login.models.Images;
import com.bezkoder.spring.security.modules.login.models.User;
import com.bezkoder.spring.security.modules.login.services.FileStorageService;
import com.bezkoder.spring.security.modules.login.services.ImageService;
import com.bezkoder.spring.security.modules.login.services.UserService;
import com.bezkoder.spring.security.modules.login.vo.UploadFileResponseVO;

import org.springframework.core.io.Resource;


@RestController
@RequestMapping("/api/user")
public class UserImageController 
{
    private Logger logger = Logger.getLogger( UserImageController.class.getName() );

    @Autowired
    private FileStorageService fileStorageService;
 
    @Autowired
    UserService UserService;

    @Autowired
    ImageService imageService;

    @PostMapping("/uploadFile/{id}")
    public UploadFileResponseVO uploadFile(@RequestParam("file") MultipartFile file, @PathVariable(value = "id") long id ) 
    {
        logger.info("Storingfile todisk");

        Optional<User> obj = UserService.findById( id );

        if (!obj.isPresent()) 
        {
            throw new NotFoundException("Thing Not found!.");
        }

        Set<Images> imagensOLD = obj.get().getImagens();
        Set<Images> images = new HashSet<>();

        var filename = fileStorageService.storeFile(file);

        String fileDownloadUri = ServletUriComponentsBuilder.fromCurrentContextPath()
        .path("/api/User/downloadFile/")
        .path(filename)
        .toUriString();

        var imageEntities = new Images( filename, fileDownloadUri );

        imageService.save( imageEntities );

        images.add(imageEntities);

        imagensOLD.forEach( imagenOLD  -> 
        {
            images.add( imagenOLD );
        });
 
        var UserEntities = new User();
        BeanUtils.copyProperties( obj.get(), UserEntities);  
        UserEntities.setImagens(images); 

        UserService.save( UserEntities );
                 
        return new UploadFileResponseVO(filename, fileDownloadUri, file.getContentType(), file.getSize());
    }


    @GetMapping("/downloadFile/{filename:.+}")
    public ResponseEntity<Resource> downloadFile(@PathVariable String filename, HttpServletRequest request) 
    {
        Resource resource = fileStorageService.loadFileAsResource(filename);
        String contentType= "";

        try
        { 
            contentType = request.getServletContext().getMimeType(resource.getFile().getAbsolutePath());
        } 
        catch(Exception e)
        {
            logger.info("Could not determine file type!");
        }

        if(contentType.isBlank()) contentType= "application/octet-stream";

        return ResponseEntity.ok().contentType(MediaType.parseMediaType(contentType))
               .header(HttpHeaders.CONTENT_DISPOSITION,"attachment; filename=\""+ resource.getFilename() + "\"").body(resource);

    }

}

