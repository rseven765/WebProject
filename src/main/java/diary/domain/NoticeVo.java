package diary.domain;

import lombok.Data;
import lombok.EqualsAndHashCode;

@Data
@EqualsAndHashCode(callSuper=false)
public class NoticeVo extends CommonVo {
    private String id;
    private String title;
    private String content;
}
