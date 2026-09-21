package com.inline.InLine.dto;

import com.inline.InLine.entity.QueueSession;
import com.inline.InLine.entity.QueueStatus;

import java.time.LocalDateTime;

public record QueueResponse(
        Long id,
        String name,
        String code,
        Integer averageServiceMinutes,
        QueueStatus status,
        LocalDateTime createdAt
) {
    public static QueueResponse from (QueueSession queueSession){
        return  new QueueResponse(
                queueSession.getId(),
                queueSession.getName(),
                queueSession.getCode(),
                queueSession.getAverageServiceMinutes(),
                queueSession.getStatus(),
                queueSession.getCreatedAt()
        );
    }
}
