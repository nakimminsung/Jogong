package bit.data.dto;

import java.sql.Timestamp;

import lombok.Data;

@Data
public class ReviewDto {

	private int num;
	private String content;
	private int rating;
	private Timestamp createdAt;
	private int publicOption;
	private int userNum;
	private int productNum;
	private int reviewImageNum;
	private int tagNum;
	
}
