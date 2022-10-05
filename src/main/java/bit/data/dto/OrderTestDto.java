package bit.data.dto;

import java.sql.Timestamp;

import lombok.Data;
import lombok.NoArgsConstructor;

@NoArgsConstructor
@Data
public class OrderTestDto {
	private int num;
	private Timestamp pay_date;
	private int point;
	
	private String imp_uid;
	private String merchant_uid;
	private String pg;
	private String pay_method;
	private String name;
	
	private String buyer_name;
	private String hp;
	private String postalcode;
	private int amount;

	private String to_member_id;
	private int count;
	private String messagecard;
	private String banner;
	private String message;

	private String addr;
	private String success;
}
