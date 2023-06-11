package com.bezkoder.spring.security.modules.login.services;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bezkoder.spring.security.modules.login.models.Images;
import com.bezkoder.spring.security.modules.login.repository.ImageRepository;


@Service
public class ImageService 
{
    @Autowired
    ImageRepository imageRepository;
    
    @Transactional
    public Images save(Images obj) 
    {
        return imageRepository.save( obj );
    }

}
