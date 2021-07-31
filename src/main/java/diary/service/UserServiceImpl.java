package diary.service;

import diary.domain.UserVo;
import diary.persistence.UserDAO;
import org.springframework.stereotype.Service;

import javax.inject.Inject;
import java.util.List;

@Service
public class UserServiceImpl implements UserService {

    @Inject
    private UserDAO dao;

    @Override
    public void create(UserVo vo) throws Exception {
        dao.create(vo);
    }

    @Override
    public UserVo read(UserVo vo) throws Exception {
        return dao.read(vo);
    }

    @Override
    public List<UserVo> all(UserVo vo) throws Exception {
        return dao.all(vo);
    }

    @Override
    public void update(UserVo vo) throws Exception {
        dao.update(vo);
    }

    @Override
    public void delete(UserVo vo) throws Exception {
        dao.delete(vo);
    }
}
