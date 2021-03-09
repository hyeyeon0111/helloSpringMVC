package kr.ac.hansung.controller;

import java.util.List;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.ObjectError;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import kr.ac.hansung.model.Offer;
import kr.ac.hansung.service.OfferService;

@Controller
public class OfferController {
	
	@Autowired
	private OfferService offerService;
	
	@RequestMapping("/offers")
	public String showOffers(Model model) {
		
		List<Offer> offers = offerService.getCurrent();
		model.addAttribute("offers", offers);
		
		return "offers";
	}
	
	@RequestMapping("/createOffer")
	public String createOffer(Model model) {
		
		model.addAttribute("offer", new Offer());
		
		return "createOffer";
	}
	
	@RequestMapping(value="/doCreate", method=RequestMethod.POST)
	public String doCreate(Model model, @Valid Offer offer, BindingResult result) {
		
		System.out.println(offer);
		
		if(result.hasErrors()) {
			System.out.println("=== Web Form data does not validated ===");
			List<ObjectError> errors = result.getAllErrors();
		
			for(ObjectError error: errors) {
				System.out.println(error.getDefaultMessage());
			}
			return "createOffer";  // 다시 입력 받음
		}
		
		offerService.insert(offer);  // controller > service > dao
		
		return "offerCreated";
	}

}
