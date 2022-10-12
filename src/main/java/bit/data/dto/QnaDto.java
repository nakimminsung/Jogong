package bit.data.dto;

import java.sql.Timestamp;

import lombok.Data;

@Data
public class QnaDto {

   private int num;
   private String title;
   private String content;
   private String imageUrl;
   private Timestamp createdAt;
   private String email;
   private String userNum;
   private String orderNum;
   private int qnaCategoryNum;
   private String qnaStatus;
   
   //qnaCategory
   private String name;
}