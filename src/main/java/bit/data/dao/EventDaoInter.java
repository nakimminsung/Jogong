package bit.data.dao;

import java.util.List;

import bit.data.dto.EventDto;

public interface EventDaoInter {
	public List<EventDto> selectEventList();
}
