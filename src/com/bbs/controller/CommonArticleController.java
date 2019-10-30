package com.bbs.controller;

import java.sql.Timestamp;
import java.util.ArrayList;
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

import com.bbs.dao.ArticleDao;
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
public class CommonArticleController {

	@Autowired
	ArticleService articleService;

	@Autowired
	BaseDictDao baseDictDao;

	@Autowired
	ArticleDao articleDao;
	
	@Autowired
	MyReplyService myReplyService;
	
	@Autowired
	MyViewService myViewService;


	// 锟斤拷取锟斤拷锟叫革拷锟斤拷
	@RequestMapping(value = "/bbs/list.action")
	public String list(@RequestParam(defaultValue = "1") Integer page, @RequestParam(defaultValue = "10") Integer row,String limitedstr,
			Model model) {
		if(limitedstr==null) {
			Page<Article> articles = new Page<>();
			articles = articleService.findArticleListByRootid(page, row, 0);
			model.addAttribute("list", articles);
		}else {
			Page<Article> articles=new Page<>();
			articles=articleService.findLimitedArticleList(page, row, 0, limitedstr);
			model.addAttribute("list", articles);
		}
		
		return "BBS_index";
	}

	// 锟斤拷取 锟斤拷锟斤拷锟斤拷锟斤拷锟斤拷锟斤拷 锟斤拷锟斤拷锟斤拷锟斤拷锟斤拷 锟皆硷拷 锟斤拷锟斤拷锟侥讹拷应锟斤拷锟斤拷
	@RequestMapping(value = "/bbs/root_child_article.action", method = RequestMethod.GET)
	public String root_child_article(@RequestParam(defaultValue = "1") Integer page,
			@RequestParam(defaultValue = "10") Integer row, Integer id, HttpSession session,Model model) {
		Article article1 = new Article();
		article1 = articleService.selectArticleById(id);
		// 锟斤拷锟斤拷锟斤拷锟斤拷锟斤拷锟斤拷锟�1
		article1.setViewcount(article1.getViewcount() + 1);
		articleService.updateArticle(article1);
		
		User user=(User) session.getAttribute("UserInfo");
		if(user!=null){
			MyView myView=new MyView();
			myView=myViewService.selectMyView(article1.getId());
			if(myView==null){
				//锟窖碉拷锟斤拷母锟斤拷锟斤拷咏锟絫_myview锟斤拷
				MyView myViewTemp=new MyView();
				myViewTemp.setView_id(article1.getId());
				myViewTemp.setView_datetime(article1.getDatatime());
				
				BaseDict baseDict=baseDictDao.selectBaseDictById(article1.getEditorNo());
				
				myViewTemp.setView_editorNo(baseDict.getDict_item_name());
				myViewTemp.setView_replycount(article1.getViewcount());
				myViewTemp.setView_viewcount(article1.getViewcount());
				myViewTemp.setWriter(user.getUsername());
				myViewTemp.setView_title(article1.getTitle());
				myViewService.insertMyView(myViewTemp);
			}
		}
		
		model.addAttribute("root_article_details", article1);

		Page<Article> child_articles = new Page<>();
		child_articles = articleService.findArticleListByPid(page, row, id);
		model.addAttribute("child_articles", child_articles);

		Article article2 = new Article();
		article2.setPid(id);
		article2.setStart(row * (page - 1));
		article2.setRows(row);
		List<Article> articles = articleDao.selectArticleListByPid(article2);

		List<Page<Article>> child_child_list_articles = new ArrayList<Page<Article>>();
		for (int i = 0; i < articles.size(); i++) {
			Integer list_id = articles.get(i).getId();
			Page<Article> child_child_articles = new Page<>();
			child_child_articles = articleService.findArticleListByPid(page, row, list_id);
			child_child_list_articles.add(child_child_articles);
		}
		model.addAttribute("child_child_list_articles", child_child_list_articles);
		return "articledetails";
	}

	// 锟斤拷锟斤拷id锟斤拷询锟斤拷锟接诧拷锟斤拷锟斤拷锟斤拷锟斤拷
	@RequestMapping(value = "/bbs/getOneArticle.action")
	@ResponseBody
	public Article getOneArticle(Integer id) {
		Article article = new Article();
		article = articleService.selectArticleById(id);
		return article;
	}

	// 锟斤拷锟斤拷锟斤拷锟桔ｏ拷锟斤拷锟斤拷锟斤拷锟斤拷
	@RequestMapping(value = "/bbs/addArticle.action", method = RequestMethod.POST)
	@ResponseBody
	public String addArticle(Integer id, String MyCommentArea_context, HttpSession session) {
		Article article = new Article();
		Date date = new Date();
		// 锟矫碉拷一锟斤拷Timestamp锟斤拷式锟斤拷时锟戒，锟斤拷锟斤拷mysql锟叫碉拷时锟斤拷锟绞斤拷锟統yyy/MM/dd HH:mm:ss锟斤拷
		Timestamp timeStamp = new Timestamp(date.getTime());
		// 锟斤拷锟斤拷锟斤拷锟斤拷锟斤拷锟斤拷pid锟斤拷锟斤拷锟斤拷锟斤拷锟斤拷id
		article.setPid(id);
		// 锟斤拷锟斤拷
		Article articletemp_one = new Article();
		articletemp_one = articleService.selectArticleById(id);
		// 锟斤拷锟斤拷锟斤拷锟斤拷锟斤拷锟斤拷锟斤拷锟斤拷锟斤拷说锟角革拷锟斤拷锟斤拷锟侥回革拷锟斤拷锟斤拷1
		articletemp_one.setReplycount(articletemp_one.getReplycount() + 1);
		// 锟斤拷锟斤拷锟斤拷锟斤拷锟斤拷叶锟接节碉拷
		articletemp_one.setIsleaf(0);
		articleService.updateArticle(articletemp_one);
		// 锟斤拷锟斤拷
		Article articletemp_root = new Article();
		articletemp_root = articleService.selectArticleById(articletemp_one.getPid());
		// 锟斤拷锟斤拷锟斤拷锟斤拷锟斤拷叶锟接节碉拷
		articletemp_root.setIsleaf(0);
		articleService.updateArticle(articletemp_root);
		// 锟斤拷锟斤拷锟斤拷锟斤拷锟絩ootid为0,锟斤拷锟斤拷锟斤拷锟斤拷锟斤拷rootid锟斤拷锟斤拷为锟斤拷锟斤拷锟斤拷id
		if (articletemp_root.getRootid() == 0) {
			article.setRootid(articletemp_root.getId());
		}
		article.setEditorNo(articletemp_root.getEditorNo());
		article.setType(articletemp_root.getType());
		article.setTitle(articletemp_root.getTitle());

		article.setContext(MyCommentArea_context);
		article.setDatatime(timeStamp);
		User user = (User) session.getAttribute("UserInfo");
		String writer = user.getUsername();
		String headicon=user.getHeadicon();
		article.setWriter(writer);
		article.setWheadicon(headicon);
		//article.setWheadicon("upload/childheadicon.jpg");
		article.setViewcount(0);
		article.setReplycount(0);
		article.setIsleaf(1);

		if(user!=null){
			MyReply myReply=new MyReply();
			myReply=myReplyService.selectMyReply(articletemp_root.getId());
			if(myReply==null){
				MyReply myReplyTemp=new MyReply();
				myReplyTemp.setReply_id(articletemp_root.getId());
				myReplyTemp.setReply_datetime(articletemp_root.getDatatime());
				
				BaseDict baseDict=baseDictDao.selectBaseDictById(articletemp_root.getEditorNo());
				
				myReplyTemp.setReply_editorNo(baseDict.getDict_item_name());
				myReplyTemp.setReply_replycount(articletemp_root.getReplycount());
				myReplyTemp.setReply_viewcount(articletemp_root.getViewcount());
				myReplyTemp.setWriter(user.getUsername());
				myReplyTemp.setReply_title(articletemp_root.getTitle());
				myReplyService.insertMyReply(myReplyTemp);
			}
		}
		
		// 锟斤拷锟斤拷锟侥回革拷锟斤拷要锟斤拷锟斤拷1
		articletemp_root.setReplycount(articletemp_root.getReplycount() + 1);
		articleService.updateArticle(articletemp_root);

		Integer count = articleService.addArticle(article);
		if (count > 0) {
			return "OK";
		} else {
			return "FAIL";
		}
	}

	@RequestMapping(value = "/bbs/publishArticle.action", method = RequestMethod.POST)
	@ResponseBody
	public String publish(String MyRootTextarea, Integer id, HttpSession session) {
		// 锟斤拷锟斤拷
		Article articletemp_root = new Article();
		articletemp_root = articleService.selectArticleById(id);
		Article article = new Article();
		article.setPid(id);
		article.setRootid(id);

		Date date = new Date();
		// 锟矫碉拷一锟斤拷Timestamp锟斤拷式锟斤拷时锟戒，锟斤拷锟斤拷mysql锟叫碉拷时锟斤拷锟绞斤拷锟統yyy/MM/dd HH:mm:ss锟斤拷
		Timestamp timeStamp = new Timestamp(date.getTime());

		// 锟斤拷锟斤拷锟斤拷锟斤拷锟斤拷锟斤拷锟斤拷锟酵伙拷锟�
		article.setEditorNo(articletemp_root.getEditorNo());
		article.setType(articletemp_root.getType());
		article.setTitle(articletemp_root.getTitle());

		article.setContext(MyRootTextarea);
		article.setDatatime(timeStamp);
		User user = (User) session.getAttribute("UserInfo");
		String writer = user.getUsername();
		String headicon=user.getHeadicon();
		article.setWriter(writer);
		article.setWheadicon(headicon);
		article.setViewcount(0);
		article.setReplycount(0);
		article.setIsleaf(1);

		//锟窖回革拷锟侥革拷锟斤拷锟接斤拷 t_myreply锟斤拷锟斤拷
		if(user!=null){
			MyReply myReply=new MyReply();
			myReply=myReplyService.selectMyReply(id);
			if(myReply==null){
				MyReply myReplyTemp=new MyReply();
				myReplyTemp.setReply_id(id);
				myReplyTemp.setReply_datetime(articletemp_root.getDatatime());
				
				BaseDict baseDict=baseDictDao.selectBaseDictById(articletemp_root.getEditorNo());
				
				myReplyTemp.setReply_editorNo(baseDict.getDict_item_name());
				myReplyTemp.setReply_replycount(articletemp_root.getReplycount());
				myReplyTemp.setReply_viewcount(articletemp_root.getViewcount());
				myReplyTemp.setWriter(user.getUsername());
				myReplyTemp.setReply_title(articletemp_root.getTitle());
				myReplyService.insertMyReply(myReplyTemp);
			}
		}
		
		// 锟斤拷锟斤拷锟侥回革拷锟斤拷要锟斤拷锟斤拷1
		articletemp_root.setReplycount(articletemp_root.getReplycount() + 1);
		articleService.updateArticle(articletemp_root);

		Integer count = articleService.addArticle(article);
		if (count > 0) {
			System.out.println(count);
			return "OK";
		} else {
			return "FAIL";
		}
	}

	@RequestMapping(value = "/bbs/publishrootarticle.action", method = RequestMethod.GET)
	@ResponseBody
	public String publishRootArticle(String publishArticleType, String publishArticleEditorNo,
			String publishArticleTitle, String publishArticleContext, HttpSession session) {
		Article article = new Article();
		article.setPid(0);
		article.setRootid(0);

		article.setEditorNo(publishArticleEditorNo);
		article.setType(publishArticleType);
		article.setTitle(publishArticleTitle);
		article.setContext(publishArticleContext);

		Date date = new Date();
		// 锟矫碉拷一锟斤拷Timestamp锟斤拷式锟斤拷时锟戒，锟斤拷锟斤拷mysql锟叫碉拷时锟斤拷锟绞斤拷锟統yyy/MM/dd HH:mm:ss锟斤拷
		Timestamp timeStamp = new Timestamp(date.getTime());
		article.setDatatime(timeStamp);
		User user = (User) session.getAttribute("AdminInfo");
		String writer = user.getUsername();
		String headicon=user.getHeadicon();
		article.setWriter(writer);
		article.setWheadicon(headicon);
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

	@RequestMapping(value = "/bbs/updaterootarticle.action", method = RequestMethod.POST)
	@ResponseBody
	public String updateRootArticle(Integer PublishArticleId, String PublishArticleType, String PublishArticleEditorNo,
			String PublishArticleTitle, String PublishArticleContext) {
		Article article = new Article();
		article = articleService.selectArticleById(PublishArticleId);
		article.setType(PublishArticleType);
		article.setEditorNo(PublishArticleEditorNo);
		article.setTitle(PublishArticleTitle);
		article.setContext(PublishArticleContext);
		Integer count = articleService.updateArticle(article);
		if (count > 0) {
			return "OK";
		} else {
			return "FAIL";
		}
	}

	@RequestMapping(value = "/bbs/deleterootarticle", method = RequestMethod.POST)
	@ResponseBody
	public String deleteRootArticle(Integer id) {
		Article article = articleService.selectArticleById(id);
		Integer count = articleService.deleteArticle(article);
		if (count > 0) {
			return "OK";
		} else {
			return "FAIL";
		}
	}
}
