package nnz.userservice.dto;

import lombok.*;
import nnz.userservice.entity.User;

import java.time.LocalDateTime;

@Getter
@NoArgsConstructor
@AllArgsConstructor
@Builder
@ToString
public class UserDTO {

    private Long id;
    private String email;
    private String phone;
    private String profileImage;
    private User.AuthProvider authProvider;
    private LocalDateTime lastLoginAt;

    public static UserDTO of(User user) {
        UserDTO dto = new UserDTO();
        dto.id = user.getId();
        dto.email = user.getEmail();
        dto.phone = user.getPhoneNumber();
        dto.profileImage = user.getProfileImage();
        dto.authProvider = user.getAuthProvider();
        dto.lastLoginAt = user.getLastLoginAt();
        return dto;
    }
}
