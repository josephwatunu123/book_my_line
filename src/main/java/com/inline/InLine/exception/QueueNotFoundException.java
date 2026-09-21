package com.inline.InLine.exception;


import org.springframework.http.HttpStatus;
import org.springframework.web.bind.annotation.ResponseStatus;

@ResponseStatus(HttpStatus.NOT_FOUND)
public class QueueNotFoundException extends RuntimeException {
    public QueueNotFoundException(String code) {
        super("Queue with code "+code +"was not found");
    }
}
