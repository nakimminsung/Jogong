package bit.data.service;

import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import bit.data.dao.OrderDetailDaoInter;
import bit.data.dto.OrderDetailDto;

@Service
public class OrderDetailService implements OrderDetailServiceInter {
	@Autowired
	OrderDetailDaoInter orderDetailDaoInter;
	
	@Override
	public void insertOrderDetail(OrderDetailDto dto) {
		
		orderDetailDaoInter.insertOrderDetail(dto);	
	}

	@Override
	public void insertSelfGift(OrderDetailDto dto) {
		orderDetailDaoInter.insertSelfGift(dto);	
	}

	@Override
	public int getMaxNum() {
		// TODO Auto-generated method stub
		return orderDetailDaoInter.getMaxNum();
	}

    @Override
    public void insertSelfCart(HashMap<String, Object> map) {
        
        orderDetailDaoInter.insertSelfCart(map);
    }
	
}
