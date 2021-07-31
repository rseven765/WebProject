package diary.domain;

import lombok.Data;
import lombok.EqualsAndHashCode;

@Data
@EqualsAndHashCode(callSuper=false)
public class DiaryVo extends CommonVo {
    private String userId;
    private String wdate;
    private String title;
    private String content;
}
