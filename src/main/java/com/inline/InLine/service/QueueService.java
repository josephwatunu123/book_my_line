package com.inline.InLine.service;

import com.inline.InLine.dto.CreateQueueRequest;
import com.inline.InLine.entity.QueueSession;
import com.inline.InLine.exception.QueueNotFoundException;
import com.inline.InLine.repository.QueueRepository;
import org.springframework.stereotype.Service;

import java.security.SecureRandom;
import java.util.Locale;

@Service
public class QueueService {

    private static final String CODE_CHARACTERS = "ABCDEFGHJKLMNPQRSTUVWXYZ23456789";

    private static final int CODE_LENGTH = 4;

    private final QueueRepository queueRepository;
    private final SecureRandom secureRandom= new SecureRandom();

    public  QueueService(QueueRepository queueRepository){
        this.queueRepository=queueRepository;
    }

    public QueueSession createQueue(CreateQueueRequest request){
        QueueSession queue = new QueueSession();

        queue.setName(request.name().trim());
        queue.setAverageServiceMinutes(request.averageServiceMinutes());
        queue.setCode(generateUniqueCode());

        return  queueRepository.save(queue);

    }

    public  QueueSession getQueueByCode (String code){
        String normalizedCode = code.trim().toUpperCase(Locale.ROOT);
        QueueSession queue = new QueueSession();
        queue= queueRepository.findByCode(normalizedCode).orElseThrow(()-> new QueueNotFoundException(normalizedCode));

        return  queue;
    }

    private  String generateUniqueCode(){
        String code;

        do{
            StringBuilder builder = new StringBuilder(CODE_LENGTH);
            for (int i = 0; i< CODE_LENGTH; i++){
                int index = secureRandom.nextInt(CODE_CHARACTERS.length());
                builder.append(CODE_CHARACTERS.charAt(index));
            }
            code=builder.toString();
        }while (queueRepository.existsByCode(code));

        return  code;
    }

}

