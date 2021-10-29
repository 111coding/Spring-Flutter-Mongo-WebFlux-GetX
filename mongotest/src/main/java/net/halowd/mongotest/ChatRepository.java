package net.halowd.mongotest;

import org.springframework.data.mongodb.repository.Query;
import org.springframework.data.mongodb.repository.ReactiveMongoRepository;
import org.springframework.data.mongodb.repository.Tailable;
import reactor.core.publisher.Flux;

public interface ChatRepository extends ReactiveMongoRepository<Chat,String> {

    @Tailable
    @Query("{receiver:?0}")
    Flux<Chat> findChatByReceiver(int receiver);
}
