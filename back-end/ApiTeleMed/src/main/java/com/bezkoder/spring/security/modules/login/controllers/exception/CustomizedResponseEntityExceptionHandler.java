package com.bezkoder.spring.security.modules.login.controllers.exception;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.context.request.WebRequest;
import org.springframework.web.servlet.mvc.method.annotation.ResponseEntityExceptionHandler;

import com.bezkoder.spring.security.modules.login.exceptions.ExceptionResponse;
import com.bezkoder.spring.security.modules.login.exceptions.file.FileStorageException;
import com.bezkoder.spring.security.modules.login.exceptions.file.MyFileNotFoundException;
import com.bezkoder.spring.security.modules.login.exceptions.others.NotFoundException;
import com.bezkoder.spring.security.modules.login.exceptions.others.UnsupportedException;


@ControllerAdvice
@RestController
public class CustomizedResponseEntityExceptionHandler extends ResponseEntityExceptionHandler
{
    @ExceptionHandler(Exception.class)
    public final ResponseEntity<ExceptionResponse> handleAllExceptions( Exception ex, WebRequest request) 
    {
        return null;
    }

    @ExceptionHandler(UnsupportedException.class)
    public final ResponseEntity<ExceptionResponse> handleBadRequestExceptions( Exception ex, WebRequest request)
    {
        ExceptionResponse exceptionResponse= new ExceptionResponse( 
            null,
            ex.getMessage(),
            request.getDescription(false));

        return new ResponseEntity<>(exceptionResponse, HttpStatus.BAD_GATEWAY);
    }

    @ExceptionHandler(NotFoundException.class)
    public final ResponseEntity<ExceptionResponse> handleNotFoundExceptions(Exception ex, WebRequest request) 
    {
        ExceptionResponse exceptionResponse= new ExceptionResponse(
            null,
            ex.getMessage(),
            request.getDescription(false)
        );
            
        return new ResponseEntity<>(exceptionResponse, HttpStatus.NOT_FOUND);
    }

    
    @ExceptionHandler(MyFileNotFoundException.class)
    public final ResponseEntity<ExceptionResponse> handleFileNotFoundExceptions(Exception ex, WebRequest request) 
    {
        ExceptionResponse exceptionResponse= new ExceptionResponse(
            null,
            ex.getMessage(),
            request.getDescription(false)
        );
            
        return new ResponseEntity<>(exceptionResponse, HttpStatus.NOT_FOUND);
    }

    
    @ExceptionHandler(FileStorageException.class)
    public final ResponseEntity<ExceptionResponse> handleFilexceptions(Exception ex, WebRequest request) 
    {
        ExceptionResponse exceptionResponse= new ExceptionResponse(
            null,
            ex.getMessage(),
            request.getDescription(false)
        );
            
        return new ResponseEntity<>(exceptionResponse, HttpStatus.INTERNAL_SERVER_ERROR);
    }
}
    