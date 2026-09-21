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
public class QueueSession {

    @Id
    @GeneratedValue(strategy= GenerationType.IDENTITY)
    private Long id;

    @Column(nullable = false)
    private String name;

    @Column(nullable = false, unique = true)
    private String code;

    @Column(nullable = false)
    private Integer averageServiceMinutes;

    @Column(nullable = false, updatable = false)
    private LocalDateTime createdAt;

    @Enumerated(EnumType.STRING)
    @Column(nullable = false)
    private QueueStatus status;


    @PrePersist
    void beforeInsert (){
        if(status == null){
            status = QueueStatus.OPEN;
        }

        if(createdAt==null){
            createdAt = LocalDateTime.now();
        }
    }


}
