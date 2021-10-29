package net.halowd.mongotest;

import lombok.Data;
import org.springframework.data.annotation.Id;
import org.springframework.data.mongodb.core.mapping.Document;

import java.time.LocalDateTime;


//db.runCommand({convertToCapped: 'chat', size: 8192});
@Data
@Document(collection = "chat")
public class Chat {

    @Id
    private String id;
    private int receiver;
    private int sender;
    private String msg;
    private LocalDateTime createdAt;


}
