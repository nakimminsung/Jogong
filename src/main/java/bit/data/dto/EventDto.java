package bit.data.dto;

import lombok.Data;

@Data
public class EventDto {
    private int num;
    private String subject;
    private String content;
    private String thumbnailImageUrl;
    private String contentImageUrl;
    private String brand;
    private String createdAt;
}
