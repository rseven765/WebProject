package diary.domain;

import lombok.Data;
import lombok.EqualsAndHashCode;

@Data
@EqualsAndHashCode(callSuper=false)
public class CommonVo {
    private String createUserId;
    private String updateUserId;
    private String createDateTime;
    private String updateDateTime;
}
