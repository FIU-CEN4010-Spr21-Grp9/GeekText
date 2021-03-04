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
    
	// http://localhost:8080/comment/query/viaproc/bybookid?bookID=774002
    @RequestMapping(value="/query/viaproc/bybookid", method=RequestMethod.GET)
    public List<Review> getReviewByBookIDLike(Integer bookID) {
        System.out.println("kxh1");
        List<Review> review = reviewService.reviewByBookIDLikeViaProc(bookID);
        if(review == null) {
            return new ArrayList<Review>();
        } else {
            return review;
        }
    }
    
    // http://localhost:8080/comment/query/viaproc/byuserid?userID=1
    @RequestMapping(value="/query/viaproc/byuserid", method=RequestMethod.GET)
    public List<Review> getCommentByUserIDLike(Integer userID) {
        System.out.println("kxh1");
        List<Review> review = reviewService.reviewByUserIDLikeViaProc(userID);
        if(review == null) {
            return new ArrayList<Review>();
        } else {
            return review;
        }
    }
}
