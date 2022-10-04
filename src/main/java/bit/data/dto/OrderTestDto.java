package bit.data.dto;

import java.sql.Timestamp;

import lombok.Data;
import lombok.NoArgsConstructor;

@NoArgsConstructor
@Data
public class OrderTestDto {
	private int num;
	private String imp_uid;
	private String merchant_uid;
	private String name;
	private int amount;
	private String buyer_name;
	private String pg;
	private String pay_method;
	private String to_member_id;
	private int count;
	private int point;
	private Timestamp pay_date;
	private String messagecard;
	private String banner;
	private String message;
	private String addr;
}
