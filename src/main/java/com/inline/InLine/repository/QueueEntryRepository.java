package com.inline.InLine.repository;

import com.inline.InLine.entity.QueueEntry;
import com.inline.InLine.entity.QueueEntryStatus;
import com.inline.InLine.entity.QueueSession;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;
import java.util.Optional;


public interface QueueEntryRepository extends JpaRepository<QueueEntry, Long> {

    long countByQueueSessionAndStatus(QueueSession queueSession, QueueEntryStatus status);

    List<QueueEntry> findByQueueSessionAndStatusOrderByJoinedAtAsc(QueueSession queueSession, QueueEntryStatus status);

    Optional<QueueEntry> findFirstByQueueSessionAndStatusOrderByJoinedAtAsc(
            QueueSession queueSession, QueueEntryStatus status);
}
