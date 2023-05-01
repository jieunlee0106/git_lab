package nnz.userservice.entity;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import lombok.ToString;
import org.springframework.data.annotation.Id;
import org.springframework.data.redis.core.RedisHash;

@RedisHash(value = "vn", timeToLive = 60 * 30) // keyspace: vn, expire: 30min
@Getter
@AllArgsConstructor
@Builder
@ToString
public class VerifyNumber {

    @Id
    private String phone;
    private Integer verifyNumber;
    private boolean isVerify;
}


