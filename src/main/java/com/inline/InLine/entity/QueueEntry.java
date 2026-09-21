package com.inline.InLine.entity;

import jakarta.persistence.*;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import java.time.LocalDateTime;

@Entity
@Getter
@Setter
@NoArgsConstructor
public class QueueEntry {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private  Long id;

    @ManyToOne(fetch = FetchType.LAZY, optional = false)
    @JoinColumn(name = "queue_session_id", nullable = false)
    private QueueSession queueSession;

    @Column(nullable = false)
    private String customerName;

    @Column(nullable = false)
    @Enumerated(EnumType.STRING)
    private QueueEntryStatus status;

    @Column(nullable = false,updatable = false)
    private LocalDateTime joinedAt;


    private LocalDateTime servedAt;

    @PrePersist
    void beforeInsert(){
        if(status==null){
            status= QueueEntryStatus.WAITING;
        }

        if(joinedAt ==null){
            joinedAt = LocalDateTime.now();
        }
    }
}
