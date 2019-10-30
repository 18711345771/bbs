package com.bbs.controller;

import java.sql.Timestamp;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.bbs.dao.BaseDictDao;
import com.bbs.po.Article;
import com.bbs.po.BaseDict;
import com.bbs.po.MyReply;
import com.bbs.po.MyView;
import com.bbs.po.User;
import com.bbs.service.ArticleService;
import com.bbs.service.MyReplyService;
import com.bbs.service.MyViewService;
import com.bbs.utils.Page;

@Controller
public class PersonerCenterController {
	
	@Autowired
	ArticleService articleService;
	
	@Autowired
	MyReplyService myReplyService;
	
	@Autowired
	MyViewService myViewService;
	
	@Autowired
	BaseDictDao baseDictDao;
	
	@RequestMapping(value="/bbs/personarticle.action",method=RequestMethod.GET)
	public String getPersonArticle(@RequestParam(defaultValue="1") Integer page,@RequestParam(defaultValue="10")Integer row,String edit_editorNo,HttpSession session,Model model){
			
			List<BaseDict> article_editorNo=baseDictDao.findBaseDictListWithTypeCode("001");
			model.addAttribute("personarticle_editorNo", article_editorNo);
			model.addAttribute("edit_editorNo", edit_editorNo);
			User user=(User) session.getAttribute("UserInfo");
			String writer=user.getUsername();
			Page<Article> personerticles=new Page<>();
			personerticles=articleService.findPersonArticleList(page, row, writer);
			model.addAttribute("page", personerticles);
			
			return "personer_center";
	}
	
	@RequestMapping(value="/bbs/updatepersonarticle.action")
	@ResponseBody
	public String  updatePersonArticle(Integer edit_personarticle_id,String edit_title,String edit_editorNo,String edit_context){
		Article article=new Article();
		article.setId(edit_personarticle_id);
		article.setTitle(edit_title);
		article.setEditorNo(edit_editorNo);
		article.setContext(edit_context);
		Integer count =articleService.updatePersonArticle(article);
		if (count>0) {
			return "OK";
		}else{
			return "FAIL";
		}
	}
	
	@RequestMapping(value = "/bbs/deletepersonarticle", method = RequestMethod.POST)
	@ResponseBody
	public String deleteRootArticle(Integer edit_personarticle_id) {
		Article article = articleService.selectArticleById(edit_personarticle_id);
		Integer count = articleService.deleteArticle(article);
		if (count > 0) {
			return "OK";
		} else {
			return "FAIL";
		}
	}
	
	@RequestMapping(value="/bbs/myreply.action")
	public String getMyReply(@RequestParam(defaultValue="1") Integer page,@RequestParam(defaultValue="10")Integer rows,HttpSession session,Model model){
		
		User user=(User) session.getAttribute("UserInfo");
		String writer=user.getUsername();
		Page<MyReply> myreplys=new Page<>();
		myreplys=myReplyService.findMyReplyList(page, rows, writer);
		model.addAttribute("page", myreplys);
		
		return "personer_center_reply";
	}
	@RequestMapping(value="/bbs/deletemyreply.action")
	@ResponseBody
	public String deleteMyreply(Integer id){
		Integer count =myReplyService.deleteMyreply(id);
		if(count>0){
			return"OK";
		}else{
			return"FAIL";
		}
	}
	
	@RequestMapping(value="/bbs/myfootstep.action")
	public String getMyView(@RequestParam(defaultValue="1") Integer page,@RequestParam(defaultValue="10")Integer rows,HttpSession session,Model model){
		
		User user=(User) session.getAttribute("UserInfo");
		String writer=user.getUsername();
		Page<MyView> myviews=new Page<>();
		myviews=myViewService.findMyViewList(page, rows, writer);
		model.addAttribute("page", myviews);
		
		return "personer_center_footstep";
	}
	

	@RequestMapping(value = "/bbs/mypublish.action")
	public String toPersoner_center_public(String publishUserArticleEditorNo,String publishUserArticleType,Model model) {
		List<BaseDict> article_editorNo=baseDictDao.findBaseDictListWithTypeCode("001");
		List<BaseDict> article_type=baseDictDao.findBaseDictListWithTypeCode("002");
		model.addAttribute("article_editorNo", article_editorNo);
		model.addAttribute("article_type", article_type);
		
		model.addAttribute("publishUserArticleEditorNo", publishUserArticleEditorNo);
		model.addAttribute("publishUserArticleType", publishUserArticleType);
	
		return "personer_center_publish";
	}
	
	@RequestMapping(value="bbs/startpublish.action")
	@ResponseBody
	public String publishUserArticle(String publishUserArticleType, String publishUserArticleEditorNo,
			String publishUserArticleTitle, String publishUserArticleContext, HttpSession session) {
		Article article = new Article();
		article.setPid(0);
		article.setRootid(0);

		article.setEditorNo(publishUserArticleEditorNo);
		article.setType(publishUserArticleType);
		article.setTitle(publishUserArticleTitle);
		article.setContext(publishUserArticleContext);

		Date date = new Date();
		// 得到一个Timestamp格式的时间，存入mysql中的时间格式“yyyy/MM/dd HH:mm:ss”
		Timestamp timeStamp = new Timestamp(date.getTime());
		article.setDatatime(timeStamp);
		User user = (User) session.getAttribute("UserInfo");
		String writer = user.getUsername();
		article.setWriter(writer);
		article.setViewcount(0);
		article.setReplycount(0);
		article.setIsleaf(1);

		Integer count = articleService.addArticle(article);
		if (count > 0) {
			return "OK";
		} else {
			return "FAIL";
		}

	}
	
}
