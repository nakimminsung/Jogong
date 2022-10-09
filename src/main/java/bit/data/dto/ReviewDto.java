package bit.data.dto;

import java.sql.Timestamp;

import com.fasterxml.jackson.annotation.JsonFormat;

import lombok.Data;

@Data
public class ReviewDto {

	private int num;
	private String subject;
	private String content;
	private int rating;
	@JsonFormat(pattern="yyyy-MM-dd", timezone = "Asia/Seoul")
	private Timestamp createdAt;
	private boolean publicOption;
	private String reviewImageUrl;
	private int userNum;
	private int productNum;
	private int tagNum;
	
	// product
	private String name;
	private String thumbnailImageUrl;
	private String brand;
	
	// user
	private String nickname;
	private String profileImage;
}
