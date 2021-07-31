package diary.persistence;


import diary.domain.UserVo;
import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import javax.inject.Inject;
import java.util.List;

@Repository
public class UserDAOImpl implements UserDAO {

    @Inject
    private SqlSession session;

    private static final String namespace = "user";

    @Override
    public void create(UserVo vo) throws Exception {
        // 저장
        session.insert(namespace + ".create", vo);
    }

    @Override
    public UserVo read(UserVo vo) throws Exception {
        return session.selectOne(namespace + ".read", vo);
    }

    @Override
    public List<UserVo> all(UserVo vo) throws Exception {
        return session.selectList(namespace + ".all", vo);
    }

    @Override
    public void update(UserVo vo) throws Exception {
        session.update(namespace + ".update", vo);
    }

    @Override
    public void delete(UserVo vo) throws Exception {
        session.delete(namespace + ".delete", vo);
    }
}
