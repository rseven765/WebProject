package diary.service;

import diary.domain.NoticeVo;
import diary.persistence.NoticeDAO;
import org.springframework.stereotype.Service;

import javax.inject.Inject;
import java.util.List;

@Service
public class NoticeServiceImpl implements NoticeService {

    @Inject
    private NoticeDAO dao;

    @Override
    public void create(NoticeVo vo) throws Exception {
        dao.create(vo);
    }

    @Override
    public NoticeVo read(NoticeVo vo) throws Exception {
        return dao.read(vo);
    }

    @Override
    public List<NoticeVo> all(NoticeVo vo) throws Exception {
        return dao.all(vo);
    }

    @Override
    public void update(NoticeVo vo) throws Exception {
        dao.update(vo);
    }

    @Override
    public void delete(NoticeVo vo) throws Exception {
        dao.delete(vo);
    }
}
