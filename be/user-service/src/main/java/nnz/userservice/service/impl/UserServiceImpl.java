package nnz.userservice.service.impl;

import com.fasterxml.jackson.core.JsonProcessingException;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import nnz.userservice.dto.MessageDTO;
import nnz.userservice.service.SmsSender;
import nnz.userservice.service.UserService;
import org.springframework.stereotype.Service;

import java.io.UnsupportedEncodingException;
import java.net.URISyntaxException;
import java.security.InvalidKeyException;
import java.security.NoSuchAlgorithmException;
import java.util.Random;

@Service
@Slf4j
@RequiredArgsConstructor
public class UserServiceImpl implements UserService {

    private final SmsSender smsSender;

    @Override
    public void sendVerifySms(String to) throws UnsupportedEncodingException, NoSuchAlgorithmException, URISyntaxException, InvalidKeyException, JsonProcessingException {
        MessageDTO messageDTO = MessageDTO.builder()
                .to(to)
                .content(createRandomNumber())
                .build();

        smsSender.sendMessage(messageDTO);
    }

    public static String createRandomNumber() {
        Random random = new Random();
        return String.format("%06d", random.nextInt(999999));
    }
}
