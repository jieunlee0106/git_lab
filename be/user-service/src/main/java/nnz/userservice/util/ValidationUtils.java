package nnz.userservice.util;

import io.github.eello.nnz.common.exception.CustomException;
import nnz.userservice.exception.ErrorCode;
import org.springframework.util.StringUtils;

import java.io.UnsupportedEncodingException;
import java.util.regex.Pattern;

public class ValidationUtils {

    /**
     * 이메일 형식 검사
     */
    public static void email(String input) {
        String regex = "^[_a-z0-9-]+(.[_a-z0-9-]+)*@(?:\\w+\\.)+\\w+$";
        Pattern p = Pattern.compile(regex);

        if (!p.matcher(input).matches()) {
            throw new CustomException(ErrorCode.INVALID_EMAIL_PATTERN);
        }
    }

    /**
     * 닉네임 형식 검사
     * - 최대 16Bytes
     * - 특수문자 사용 불가
     * - 공백 불가
     * - 단일 자음 또는 모음 불가(한글)
     */
    public static void nickname(String input) throws UnsupportedEncodingException {
        // 공백 문자열이거나 총 16Bytes가 넘는지 검사
        if (!StringUtils.hasText(input) || input.getBytes("euc-kr").length > 16) {
            throw new CustomException(ErrorCode.INVALID_NICKNAME_PATTERN);
        }

        Pattern p1 = Pattern.compile(".*[ㄱ-ㅎ|ㅏ-ㅣ]+.*"); // 단일 자음 또는 모음 체크
        Pattern p2 = Pattern.compile("[ !@#$%^&*(),.?\":{}|<>]"); // 공백 포함 특수문자 체크
        if (p1.matcher(input).matches() || p2.matcher(input).find()) {
            throw new CustomException(ErrorCode.INVALID_NICKNAME_PATTERN);
        }
    }
}
