package bit.data.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import bit.data.dto.EventDto;

@Repository
public class EventDao implements EventDaoInter {
    
    @Autowired
    SqlSession session;
    String ns="bit.data.dao.EventDao.";

    @Override
    public List<EventDto> selectEventList() {
        return session.selectList(ns+"selectEventList");
    }

}
