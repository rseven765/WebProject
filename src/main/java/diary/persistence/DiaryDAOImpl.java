package diary.persistence;


import diary.domain.DiaryVo;
import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import javax.inject.Inject;
import java.util.List;

@Repository
public class DiaryDAOImpl implements DiaryDAO {

    @Inject
    private SqlSession session;

    private static final String namespace = "diary";

    @Override
    public void create(DiaryVo vo) throws Exception {
        // 저장
        session.insert(namespace + ".create", vo);
    }

    @Override
    public DiaryVo read(DiaryVo vo) throws Exception {
        return session.selectOne(namespace + ".read", vo);
    }

    @Override
    public List<DiaryVo> all(DiaryVo vo) throws Exception {
        return session.selectList(namespace + ".all", vo);
    }

    @Override
    public void update(DiaryVo vo) throws Exception {
        session.update(namespace + ".update", vo);
    }

    @Override
    public void delete(DiaryVo vo) throws Exception {
        session.delete(namespace + ".delete", vo);
    }
}
