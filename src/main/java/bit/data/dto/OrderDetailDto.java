package bit.data.dto;

import lombok.Data;

@Data
public class OrderDetailDto {
	private int num;
	private int qty;
	private String messageCard;
	private String engrave;
	private int friendNum;
	private int userNum;
	private int productNum;
	private String productOption;
}
