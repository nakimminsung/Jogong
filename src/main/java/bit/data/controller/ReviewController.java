package bit.data.controller;

import java.io.File;
import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import bit.data.dto.ProductDto;
import bit.data.dto.ReviewDto;
import bit.data.service.ReviewServiceInter;
import util.ChangeName;

@Controller
@RequestMapping("/review")
public class ReviewController {
    
	@Autowired
	ReviewServiceInter reviewService;
	
    @GetMapping("/page")
    public String reviewPage() {
        return "/mypage/mypage/review";
    }

    @GetMapping("/list")
    @ResponseBody
	public ModelAndView reviewList()
	{
    	ModelAndView mview = new ModelAndView();
    	List<ReviewDto> list = reviewService.getReviewList();
    	mview.addObject("list",list);
    	mview.setViewName("/bit/review/reviewMain");
		
    	return mview; 
	}
    
	// 상세페이지 
	@GetMapping("/productReview")
	@ResponseBody
	public List<ReviewDto> getProductReviewList(int productNum)
	{
		return reviewService.getProductReviewList(productNum);
	}
	
	// 상세페이지 리뷰수
	@GetMapping("/count")
	@ResponseBody
	public int getReviewCount(int productNum)
	{
		return reviewService.getReviewCount(productNum);
	}
	
	// 마이페이지 작성한 리뷰목록
	@GetMapping("/writtenReview")
	@ResponseBody
	public List<ReviewDto> selectReviewByUser(int userNum) {
	    return reviewService.selectReviewByUser(userNum);
	}
	
	// 마이페이지 리뷰수
	@GetMapping("/myCount")
	@ResponseBody
	public int selectReviewCount(int userNum) {
	    return reviewService.selectReviewCount(userNum);
	}
	
	// 리뷰생성
	@PostMapping("/insert")
	public String insertReview(ReviewDto reviewDto, List<MultipartFile> upload, HttpServletRequest request) {
	    
        String path = request.getSession().getServletContext().getRealPath("/resources/upload");
        
        if(upload.get(0).getOriginalFilename().equals("")) {
            reviewDto.setReviewImageUrl("no");
        }else {
            String photo = "";
            int idx=1;
            for(MultipartFile multi:upload) {

                String newName = idx++ + "_" + ChangeName.getChangeFileName(multi.getOriginalFilename());
                photo += newName+",";
                
                try {
                    multi.transferTo(new File(path+"/"+newName));
                } catch (IllegalStateException | IOException e) {
                    e.printStackTrace();
                }
                
            }
            photo = photo.substring(0,photo.length()-1);
            reviewDto.setReviewImageUrl(photo);
        }
	    reviewService.insertReview(reviewDto);
	    return "/mypage/mypage/review";
	}
	
	// 리뷰 삭제 
	@GetMapping("/delete")
	public String deleteReview(int num) {
	    reviewService.deleteReview(num);
	    return "/mypage/mypage/review";
	}
	
	// 리뷰 단건 조회
	@GetMapping("/selectOne")
	@ResponseBody
	public ReviewDto selectReviewByNum(int num) {
	    return reviewService.selectReviewByNum(num);
	}
	
	// 리뷰 업데이트
	@PostMapping("/update")
	public String updateReview(ReviewDto reviewDto, List<MultipartFile> upload, HttpServletRequest request) {
	    
	       // 톰캣에 올라간 upload 폴더 경로 구하기
        String path = request.getSession().getServletContext().getRealPath("/resources/upload");
        
        if(upload.get(0).getOriginalFilename().equals("")) {
            reviewDto.setReviewImageUrl(null); // 기존 사진을 저장하지 않음
        }else {
            String photo = "";
            int idx=1;
            for(MultipartFile multi:upload) {
                
                //파일명을 현재 날짜로 변경 후 ,로 연결
                String newName = idx++ + "_" + ChangeName.getChangeFileName(multi.getOriginalFilename());
                photo += newName+",";
                
                // 업로드
                try {
                    multi.transferTo(new File(path+"/"+newName));
                } catch (IllegalStateException | IOException e) {
                    e.printStackTrace();
                }
                
            }
            // 마지막 컴마 제거
            photo = photo.substring(0,photo.length()-1);
            // dto에 저장
            reviewDto.setReviewImageUrl(photo);
        }
        reviewService.updateReview(reviewDto);
        
        return "/mypage/mypage/review";
	}
}
