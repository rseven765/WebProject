package diary.service;

import diary.domain.UserVo;

import java.util.List;

public interface UserService {
    // 등록
    void create(UserVo vo) throws Exception;

    // 읽기
    UserVo read(UserVo vo) throws Exception;

    // 목록
    List<UserVo> all(UserVo vo) throws Exception;

    // 수정
    void update(UserVo vo) throws Exception;

    // 삭제
    void delete(UserVo vo) throws Exception;
}
