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
	private Timestamp pay_date;
}
