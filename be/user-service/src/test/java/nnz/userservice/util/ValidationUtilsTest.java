package nnz.userservice.util;

import io.github.eello.nnz.common.exception.CustomException;
import org.junit.jupiter.api.Test;

import java.io.UnsupportedEncodingException;

import static org.junit.jupiter.api.Assertions.*;

class ValidationUtilsTest {

    @Test
    void email_pattern_test() {
        assertThrows(CustomException.class, () -> ValidationUtils.email("aaaa"));
        assertDoesNotThrow(() -> ValidationUtils.email("aaa@aa.a"));
    }

    @Test
    void nickname_pattern_test() throws UnsupportedEncodingException {
        assertThrows(CustomException.class, () -> ValidationUtils.nickname("가나다라마바사아자"));
        assertThrows(CustomException.class, () -> ValidationUtils.nickname("        "));
        assertThrows(CustomException.class, () -> ValidationUtils.nickname("aaaaaaaaaaaaaaaaa"));
        assertThrows(CustomException.class, () -> ValidationUtils.nickname("가나다랍바ㅏ"));
        assertThrows(CustomException.class, () -> ValidationUtils.nickname("가나다랍바ㅂ"));

        assertDoesNotThrow(() -> ValidationUtils.nickname("a"));
        assertDoesNotThrow(() -> ValidationUtils.nickname("가"));
        assertDoesNotThrow(() -> ValidationUtils.nickname("가나다라마바사아")); // 한글 8글자
        assertDoesNotThrow(() -> ValidationUtils.nickname("aaaaaaaaaaaaaaaa")); // 영문 16글자
    }

}