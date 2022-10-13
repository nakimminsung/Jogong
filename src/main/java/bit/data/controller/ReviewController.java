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
	public String reviewList(
			@RequestParam(defaultValue = "1") int currentPage, /*null 일경우 기본페이지를 1로*/
			@RequestParam(value="searchcolumn", required = false) String sc, /*required = false: 값이 없을경우 null*/
			@RequestParam(value="searchword", required = false) String sw,
			Model model
			)
	{
		//페이징 처리에 필요한 변수들
		//전체 갯수
		int totalCount=reviewService.getTotalCount(sc, sw);
		int perPage=100000;//한페이지당 보여질 글의 갯수
		int perBlock=5;//한블럭당 보여질 페이지의 갯수
		int startNum;//db에서 가져올 글의 시작번호(mysql은 첫글이 0번,오라클은 1번)
		int startPage;//각블럭당 보여질 시작페이지
		int endPage;//각 블럭당 보여질 끝페이지
		int totalPage;//총 페이지수
		int no;//각 페이지당 출력할 시작번호
		

		//총 페이지수를 구한다
		//총글의갯수/한페이지당보여질갯수로 나눔(7/5=1)
		//나머지가 1이라도 있으면 무조건 1페이지 추가(1+1=2페이지가 필요)
		totalPage=totalCount/perPage+(totalCount%perPage==0?0:1);

		//각 블럭당 보여질 시작페이지
		//perBlock=5 일경우 현재페이지가 1~5 일경우는 시작페이지가 1, 끝페이지가 5
		//만약 현재페이지가 13 일경우는 시작페이지가 11, 끝페이지가 15
		startPage=(currentPage-1)/perBlock*perBlock+1;
		endPage=startPage+perBlock-1;
		//총페이지수가 23개일경우 마지막 블럭은 끝페이지가 25가 아니라 23이라야한다
		if(endPage>totalPage)
			endPage=totalPage;

		//각 페이지에서 보여질 시작번호
		//예: 1페이지->0, 2페이지:5, 3페이지 : 10...
		startNum=(currentPage-1)*perPage;

		//각페이지당 출력할 시작번호 구하기
		//예: 총글갯수가 23이라면  1페이지는 23,2페이지는 18,3페이지는 13...
		no=totalCount-(currentPage-1)*perPage;

		//페이지에서 보여질 글만 가져오기
		List<ReviewDto> list=reviewService.getPagingList(sc, sw, startNum, perPage);
		
		//request에 출력시 필요한 변수들을 넣어준다
		model.addAttribute("list",list);
		model.addAttribute("totalCount",totalCount);
		model.addAttribute("currentPage",currentPage);
		model.addAttribute("startPage",startPage);
		model.addAttribute("endPage",endPage);
		model.addAttribute("no",no);
		model.addAttribute("totalPage",totalPage);

		System.out.println("totalCount=" +totalCount);
		return "/bit/review/reviewMain";
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
            //reviewDto.setReviewImageUrl("");
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
