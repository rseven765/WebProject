package diary.service;

import diary.domain.DiaryVo;

import java.util.List;

public interface DiaryService {
    // 등록
    void create(DiaryVo vo) throws Exception;

    // 읽기
    DiaryVo read(DiaryVo vo) throws Exception;

    // 목록
    List<DiaryVo> all(DiaryVo vo) throws Exception;

    // 수정
    void update(DiaryVo vo) throws Exception;

    // 삭제
    void delete(DiaryVo vo) throws Exception;
}
