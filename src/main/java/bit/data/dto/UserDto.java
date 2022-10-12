package bit.data.dto;

import java.sql.Timestamp;

import lombok.Data;

@Data
public class UserDto {
	private int num;
	private String email;
	private String password;
	private String salt;
	private String nickname;
	private String profileImage;
	private String phone;
	private String address;
	private int gender;
	private int point;
	private String year;
	private String date;
	private String loginType;
	private Timestamp createdAt;
	private boolean isAdmin;
	private String status;
}
