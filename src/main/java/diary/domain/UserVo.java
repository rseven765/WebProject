package diary.domain;

import lombok.Data;
import lombok.EqualsAndHashCode;

@Data
@EqualsAndHashCode(callSuper=false)
public class UserVo extends CommonVo {
    private String userId;
    private String userPassword;
    private String userName;
    private String userTel;
    private String userEmail;
    private String userType;
}
