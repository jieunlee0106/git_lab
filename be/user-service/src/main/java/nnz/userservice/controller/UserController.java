package nnz.userservice.controller;

import com.fasterxml.jackson.core.JsonProcessingException;
import lombok.RequiredArgsConstructor;
import nnz.userservice.service.UserService;
import nnz.userservice.vo.CheckVerifyVO;
import nnz.userservice.vo.VerifyVO;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

import java.io.UnsupportedEncodingException;
import java.net.URISyntaxException;
import java.security.InvalidKeyException;
import java.security.NoSuchAlgorithmException;
import java.util.HashMap;
import java.util.Map;

@RestController
@RequiredArgsConstructor
public class UserController {

    private final UserService userService;

    @PostMapping("/users/verify")
    public ResponseEntity<Void> sendMessage(@RequestBody VerifyVO vo) throws UnsupportedEncodingException, NoSuchAlgorithmException, URISyntaxException, InvalidKeyException, JsonProcessingException {
        userService.sendVerifySms(vo.getPhone());
        return ResponseEntity.ok(null);
    }

    @PostMapping("/users/verify/check")
    public ResponseEntity<Map<String, Boolean>> checkVerify(@RequestBody CheckVerifyVO vo) {
        boolean result = userService.verify(vo.getPhone(), vo.getVerifyNum());

        Map<String, Boolean> response = new HashMap<>();
        response.put("verify", result);
        return ResponseEntity.ok(response);
    }

}