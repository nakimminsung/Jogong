package bit.data.dto;

import lombok.Data;

@Data
public class CartListDto {
	private int num;
	private int qty;
	private String messageCard;
	private String engrave;
	private int userNum;
	private int productNum;
	
	// product
	private String name;
	private int price;
	private boolean deleveryOption;
	private String thumbnailImageUrl;
	private String brand;
}
