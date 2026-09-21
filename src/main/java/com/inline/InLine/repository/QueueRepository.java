package com.inline.InLine.repository;

import com.inline.InLine.entity.QueueSession;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.Optional;

public interface QueueRepository extends JpaRepository<QueueSession, Long> {

    Optional<QueueSession> findByCode (String code);

    boolean existsByCode (String code);
}
