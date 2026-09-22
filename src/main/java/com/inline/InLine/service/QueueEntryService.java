package com.inline.InLine.service;

import com.inline.InLine.dto.JoinQueueRequest;
import com.inline.InLine.dto.QueueEntryResponse;
import com.inline.InLine.entity.QueueEntry;
import com.inline.InLine.entity.QueueEntryStatus;
import com.inline.InLine.entity.QueueSession;
import com.inline.InLine.entity.QueueStatus;
import com.inline.InLine.exception.NoWaitingCustomerException;
import com.inline.InLine.repository.QueueEntryRepository;
import jakarta.transaction.Transactional;
import org.springframework.stereotype.Service;

import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;

@Service
public class QueueEntryService {

    private final QueueEntryRepository queueEntryRepository;
    private final QueueService queueService;

    public QueueEntryService(QueueEntryRepository repository, QueueService queueService) {
        this.queueEntryRepository = repository;
        this.queueService = queueService;
    }

    @Transactional
    public QueueEntryResponse joinQueue(String code, JoinQueueRequest request) {
        //get the queue from code
        QueueSession queueSession = queueService.getQueueByCode(code);

        if (queueSession.getStatus() != QueueStatus.OPEN) {
            throw new IllegalStateException("Cannot join a closed queue");
        }
        //Add the user to that queue
        QueueEntry entry = new QueueEntry();
        entry.setQueueSession(queueSession);
        entry.setCustomerName(request.customerName().trim());

        QueueEntry savedEntry = queueEntryRepository.save(entry);

        //return queueResponse
        long position = queueEntryRepository.countByQueueSessionAndStatus(queueSession, QueueEntryStatus.WAITING);

        return QueueEntryResponse.from(savedEntry, position);

    }

    @Transactional
    public List<QueueEntryResponse> getWaitingEntries(String code) {
        QueueSession queueSession = queueService.getQueueByCode(code);

        List<QueueEntry> entries = queueEntryRepository.findByQueueSessionAndStatusOrderByJoinedAtAsc(queueSession, QueueEntryStatus.WAITING);

        List<QueueEntryResponse> responses = new ArrayList<>();

        for (int i = 0; i < entries.size(); i++) {
            long position = i + 1L;

            responses.add(QueueEntryResponse.from(entries.get(i), position));
        }

        return responses;
    }

    @Transactional
    public QueueEntryResponse serveNext(String code) {
        QueueSession queueSession = queueService.getQueueByCode(code);

        QueueEntry nextEntry = queueEntryRepository.findFirstByQueueSessionAndStatusOrderByJoinedAtAsc(
                queueSession, QueueEntryStatus.WAITING).orElseThrow(() ->
                new NoWaitingCustomerException(queueSession.getCode()));

        nextEntry.setStatus(QueueEntryStatus.SERVED);
        nextEntry.setServedAt(LocalDateTime.now());

        QueueEntry savedEntry = queueEntryRepository.save(nextEntry);

        return QueueEntryResponse.from(savedEntry, null);

    }
}
