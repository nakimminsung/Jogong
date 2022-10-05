package bit.data.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import bit.data.dto.OrderDetailDto;
import bit.data.dto.OrderDto;
import bit.data.dto.OrderTestDto;
import bit.data.dto.ProductDto;

@Repository
public class OrderDao implements OrderDaoInter {
	
	@Autowired
	SqlSession session;
	String ns = "bit.data.dao.OrderDao.";
	
	@Override
	public List<OrderDto> getAllSearch() {
		// TODO Auto-generated method stub
		return session.selectList(ns+"getAllSearch");
	}

	
	@Override
	public String getItemNameSearch(int num) {
		// TODO Auto-generated method stub
		return session.selectOne(ns+"getItemNameSearch",num);

	}

	@Override
	public Integer getItemPriceSearch(int num) {
		// TODO Auto-generated method stub
		return session.selectOne(ns+"getItemPriceSearch",num);
	}

	@Override
	public String getItemThumbnailSearch(int num) {
		// TODO Auto-generated method stub
		return session.selectOne(ns+"getItemThumbnailSearch",num);
	}

	@Override
	public String getfriendNickNameSearch(int num) {
		// TODO Auto-generated method stub
		return session.selectOne(ns+"getfriendNickNameSearch",num);
	}

	@Override
	public String getNickNameSearch(int num) {
		// TODO Auto-generated method stub
		return session.selectOne(ns+"getNickNameSearch",num);
	}

	@Override
	public Integer getCount(int num) {
		// TODO Auto-generated method stub
		return session.selectOne(ns+"getCount",num);
	}

	@Override
	public void insertOrder(OrderDto dto) {
		
		session.insert(ns+"insertOrder",dto);
	}


	@Override
	public Integer getUserNum(int num) {
		// TODO Auto-generated method stub
		return session.selectOne(ns+"getUserNum",num);
	}


	@Override
	public Integer getOrderDetailNum(int num) {
		// TODO Auto-generated method stub
		return session.selectOne(ns+"getOrderDetailNum",num);
	}

}
