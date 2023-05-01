package nnz.userservice.controller;

import com.fasterxml.jackson.core.JsonProcessingException;
import lombok.RequiredArgsConstructor;
import nnz.userservice.service.UserService;
import nnz.userservice.vo.CheckVerifyVO;
import nnz.userservice.vo.VerifyVO;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

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

    @GetMapping("/users/check")
    public ResponseEntity<Map<String, Boolean>> duplicateCheck(@RequestParam("type") String type,
                                                              @RequestParam("val") String val) {
        Map<String, Boolean> response = new HashMap<>();
        response.put("available", !userService.isExist(type, val)); // 존재하면 사용 불가능이므로 not 연산하여 응답
        return ResponseEntity.ok(response);
    }
}