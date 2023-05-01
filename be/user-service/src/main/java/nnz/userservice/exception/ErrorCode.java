package nnz.userservice.exception;

import io.github.eello.nnz.common.exception.AbstractErrorCode;
import lombok.RequiredArgsConstructor;
import org.springframework.http.HttpStatus;

import static org.springframework.http.HttpStatus.BAD_REQUEST;
import static org.springframework.http.HttpStatus.NOT_FOUND;

@RequiredArgsConstructor
public enum ErrorCode implements AbstractErrorCode {

    INVALID_NICKNAME_PATTERN("U003", "올바르지 않은 닉네임 형식입니다.", BAD_REQUEST),
    INVALID_EMAIL_PATTERN("U005", "올바르지 이메일 형식입니다.", BAD_REQUEST),
    NOT_FOUND_VERIFY("U006", "존재하지 않는 인증정보입니다.", NOT_FOUND),
    ;

    private final String code;
    private final String message;
    private final HttpStatus status;

    @Override
    public String getCode() {
        return this.code;
    }

    @Override
    public String getMessage() {
        return this.message;
    }

    @Override
    public HttpStatus getStatus() {
        return this.status;
    }
}
