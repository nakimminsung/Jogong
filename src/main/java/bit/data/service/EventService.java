package bit.data.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import bit.data.dao.EventDaoInter;
import bit.data.dto.EventDto;

@Service
public class EventService implements EventServiceInter {
    
    @Autowired
    EventDaoInter eventDaoInter;

    @Override
    public List<EventDto> selectEventList() {
        return eventDaoInter.selectEventList();
    }

}
