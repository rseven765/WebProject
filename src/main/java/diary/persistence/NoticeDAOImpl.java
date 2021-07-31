package diary.persistence;


import diary.domain.NoticeVo;
import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import javax.inject.Inject;
import java.util.List;

@Repository
public class NoticeDAOImpl implements NoticeDAO {

    @Inject
    private SqlSession session;

    private static final String namespace = "notice";

    @Override
    public void create(NoticeVo vo) throws Exception {
        // 저장
        session.insert(namespace + ".create", vo);
    }

    @Override
    public NoticeVo read(NoticeVo vo) throws Exception {
        return session.selectOne(namespace + ".read", vo);
    }

    @Override
    public List<NoticeVo> all(NoticeVo vo) throws Exception {
        return session.selectList(namespace + ".all", vo);
    }

    @Override
    public void update(NoticeVo vo) throws Exception {
        session.update(namespace + ".update", vo);
    }

    @Override
    public void delete(NoticeVo vo) throws Exception {
        session.delete(namespace + ".delete", vo);
    }
}
