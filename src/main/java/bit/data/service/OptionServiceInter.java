package bit.data.service;

import java.util.List;

import bit.data.dto.OptionDto;

public interface OptionServiceInter {
	public List<OptionDto> getAllOption(int productNum);
}
