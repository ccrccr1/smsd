package spring.sts.smsd;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RestController;

import spring.model.mapper.ReviewMapper;

@RestController
public class ReviewController {
	
	@Autowired
	private ReviewMapper rmapper;

}
