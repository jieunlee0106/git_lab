package nnz.userservice.controller;

import com.fasterxml.jackson.core.JsonProcessingException;
import lombok.RequiredArgsConstructor;
import nnz.userservice.service.UserService;
import nnz.userservice.vo.VerifyVO;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

import java.io.UnsupportedEncodingException;
import java.net.URISyntaxException;
import java.security.InvalidKeyException;
import java.security.NoSuchAlgorithmException;

@RestController
@RequiredArgsConstructor
public class UserController {

    private final UserService userService;

    @PostMapping("/users/verify")
    public ResponseEntity<Void> sendMessage(@RequestBody VerifyVO vo) throws UnsupportedEncodingException, NoSuchAlgorithmException, URISyntaxException, InvalidKeyException, JsonProcessingException {
        userService.sendVerifySms(vo.getPhone());
        return ResponseEntity.ok(null);
    }

}