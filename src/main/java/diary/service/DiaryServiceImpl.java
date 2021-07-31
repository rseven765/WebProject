package diary.service;

import diary.domain.DiaryVo;
import diary.persistence.DiaryDAO;
import org.springframework.stereotype.Service;

import javax.inject.Inject;
import java.util.List;

@Service
public class DiaryServiceImpl implements DiaryService {

    @Inject
    private DiaryDAO dao;

    @Override
    public void create(DiaryVo vo) throws Exception {
        dao.create(vo);
    }

    @Override
    public DiaryVo read(DiaryVo vo) throws Exception {
        return dao.read(vo);
    }

    @Override
    public List<DiaryVo> all(DiaryVo vo) throws Exception {
        return dao.all(vo);
    }

    @Override
    public void update(DiaryVo vo) throws Exception {
        dao.update(vo);
    }

    @Override
    public void delete(DiaryVo vo) throws Exception {
        dao.delete(vo);
    }
}
