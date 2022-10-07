package bit.data.dto;

import java.sql.Timestamp;

import com.fasterxml.jackson.annotation.JsonFormat;

import lombok.Data;

@Data
public class OrderDto {
	private int num;
	private String imp_uid;
	private int totalPrice;
	@JsonFormat(locale="zh", timezone="GMT+8", pattern="yyyy-MM-dd HH:mm")
	private Timestamp orderDate;
	private String pg;
	private String pay_method;
	private int paidPoint;
	private String deliveryAddress;
	private String orderStatus;
	private int deliveryCharge;
	private String messagecard;
	private String banner;
	private String message;
	private String hp;
	private String postalcode;
	private int count;
	private int userNum;
	private int orderDetailNum;
	private int friendNum;
	private int productNum;
	private String nickname;
	private String profileImage;
	private String productName;
	private String thumbnailImageUrl;
	private String brand;
	
}
