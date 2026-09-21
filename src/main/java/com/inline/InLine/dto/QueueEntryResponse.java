package com.inline.InLine.dto;

import com.inline.InLine.entity.QueueEntry;
import com.inline.InLine.entity.QueueEntryStatus;

import java.time.LocalDateTime;

public record QueueEntryResponse(Long id, String queueCode, String customerName, QueueEntryStatus status, long position,
                                 LocalDateTime joinedAt, LocalDateTime servedAt) {
    public static QueueEntryResponse from(QueueEntry entry, long position) {
        return new QueueEntryResponse(entry.getId(), entry.getQueueSession().getCode(), entry.getCustomerName(), entry.getStatus(), position, entry.getJoinedAt(), entry.getServedAt());
    }
}
