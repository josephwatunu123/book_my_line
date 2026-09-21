package com.inline.InLine.controller;

import com.inline.InLine.dto.CreateQueueRequest;
import com.inline.InLine.dto.QueueResponse;
import com.inline.InLine.entity.QueueSession;
import com.inline.InLine.service.QueueService;
import jakarta.validation.Valid;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

@RestController
@RequestMapping("/api/queues")
public class QueueController {

    private final QueueService queueService;

    public QueueController(QueueService queueService){
        this.queueService=queueService;
    }

    @PostMapping
    public ResponseEntity<QueueResponse> createQueue(
            @Valid @RequestBody CreateQueueRequest request
            ){
        QueueSession createdQueue = queueService.createQueue(request);

        return ResponseEntity.status(HttpStatus.CREATED).body(QueueResponse.from(createdQueue));
    }

    @GetMapping("/{code}")
    public ResponseEntity<QueueResponse> getQueueByCode(@PathVariable String code){
        QueueSession queue = queueService.getQueueByCode(code);

        return  ResponseEntity.ok(QueueResponse.from(queue));
    }
}
