package com.inline.InLine.exception;

import org.springframework.http.HttpStatus;
import org.springframework.web.bind.annotation.ResponseStatus;

@ResponseStatus(HttpStatus.CONFLICT)
public class NoWaitingCustomerException extends RuntimeException {
    public NoWaitingCustomerException(String code) {
        super("Queue '"+code+"' has no waiting customers");
    }
}
