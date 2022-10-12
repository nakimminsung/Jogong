package bit.data.service;

import java.util.List;

import bit.data.dto.EventDto;

public interface EventServiceInter {
    public List<EventDto> selectEventList();
}
