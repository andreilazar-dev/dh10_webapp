package com.dh10.dh10_web.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.dh10.dh10_web.model.SynonyBean;
import com.dh10.dh10_web.service.SinonymousService;
import com.dh10.stringchecker.model.beans.Synonymus;
import com.dh10.stringchecker.model.dao.SynonymusDao;

@Controller
public class GetAllSynonymusController {
	private SinonymousService synDao = new SinonymousService();
	
    @RequestMapping(method = RequestMethod.GET)
    public String init(Model model) {
        SynonyBean syn = new SynonyBean();
        model.addAttribute("SynonyBean",syn);
        return "syn";
    }

	@RequestMapping(value = "/fetch", method = RequestMethod.POST)
	public ModelAndView listSynonymus(ModelAndView model) throws IOException {

		List<Synonymus> listSyn = synDao.synonymusAll();
		int n = listSyn.size();
		model.addObject("listSyn", listSyn);
		model.addObject("numSyn", n);
		model.setViewName("visallsyno");

		return model;
	}
	
	@RequestMapping(value = "/fetchNoFound", method = RequestMethod.POST)
	public ModelAndView listSynonymusNotFound(ModelAndView model) throws IOException {

		List<Synonymus> listSyn = synDao.synonymusUnassociated();
		int n= listSyn.size();

			
			model.addObject("listSyn", listSyn);
			model.addObject("numSyn", n);
			model.setViewName("visnofound");
		return model;
	}
	
	@RequestMapping(value = "/fetchApprove", method = RequestMethod.POST)
	public ModelAndView listSynonymusApprove(ModelAndView model) throws IOException {

		List<Synonymus> listSyn = synDao.synonymusToApprove();
		int n=listSyn.size();
			model.addObject("listSyn", listSyn);
			model.addObject("numSyn", n);
			model.setViewName("visapprove");
		return model;
	}
}
