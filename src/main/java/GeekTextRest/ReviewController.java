package GeekTextRest;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/review")

public class ReviewController {
	@Autowired
    ReviewService reviewService;
    
	// http://localhost:8080/review/query/viaproc/byreviewid?reviewID=1
	// http://localhost:8080/review/query/viaproc/byreviewid?reviewID=2
    @RequestMapping(value="/query/viaproc/byreviewid", method=RequestMethod.GET)
    public List<Review> getReviewByReviewID(Integer reviewID) {
        System.out.println("kxh1");
        List<Review> review = reviewService.reviewByReviewIDViaProc(reviewID);
        if(review == null) {
            return new ArrayList<Review>();
        } else {
            return review;
        }
    }
    
    // http://localhost:8080/review/query/viaproc/bybookid?bookID=774001
    @RequestMapping(value="/query/viaproc/bybookid", method=RequestMethod.GET)
    public List<Review> getReviewByBookID(Integer bookID) {
        System.out.println("kxh1");
        List<Review> review = reviewService.reviewByBookIDViaProc(bookID);
        if(review == null) {
            return new ArrayList<Review>();
        } else {
            return review;
        }
    }
}
