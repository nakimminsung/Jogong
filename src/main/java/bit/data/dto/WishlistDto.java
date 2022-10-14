package bit.data.dto;

import lombok.Data;

@Data
public class WishlistDto {
	private int num;
	private boolean publicOption;
	private int userNum;
	private int productNum;
	
	// product
    private String name;
    private int price;
    private String thumbnailImageUrl;
    
    // user
    private String nickname;
}
