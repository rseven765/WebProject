package diary.service;

import diary.domain.NoticeVo;

import java.util.List;

public interface NoticeService {
    // 등록
    void create(NoticeVo vo) throws Exception;

    // 읽기
    NoticeVo read(NoticeVo vo) throws Exception;

    // 목록
    List<NoticeVo> all(NoticeVo vo) throws Exception;

    // 수정
    void update(NoticeVo vo) throws Exception;

    // 삭제
    void delete(NoticeVo vo) throws Exception;
}
