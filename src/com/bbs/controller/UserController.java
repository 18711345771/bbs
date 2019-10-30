package com.bbs.controller;

import java.io.File;
import java.sql.Timestamp;
import java.util.Date;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.bbs.dao.BaseDictDao;
import com.bbs.po.Article;
import com.bbs.po.BaseDict;
import com.bbs.po.BasicInformation;
import com.bbs.po.ContractInformation;
import com.bbs.po.CurrentStates;
import com.bbs.po.EducationInformation;
import com.bbs.po.User;
import com.bbs.service.ArticleService;
import com.bbs.service.BasicInformationService;
import com.bbs.service.ContractInformationService;
import com.bbs.service.CurrentStatesService;
import com.bbs.service.EducationInformationService;
import com.bbs.service.UserService;
import com.bbs.utils.CutImageUtils;
import com.bbs.utils.Page;

import net.sf.json.JSONObject;

@Controller
public class UserController {

	@Autowired
	UserService userService;

	@Autowired
	ArticleService articleService;

	@Autowired
	BaseDictDao baseDictDao;
	
	@Autowired
	BasicInformationService basicInformationService;
	
	@Autowired
	ContractInformationService contractInformationService;

	@Autowired
	EducationInformationService educationInformationService; 
	
	@Autowired
	CurrentStatesService currentStatesService;
	
	@Value("${ARTICLE_EDITORNO}")
	private String ARTICLE_EDITORNO;
	@Value("${ARTICLE_TYPE}")
	private String ARTICLE_TYPE;

	@RequestMapping(value = "/bbs/userlogin.action", method = RequestMethod.POST)
	@ResponseBody
	public String userlogin(String l_username, String l_password, String l_identity, HttpSession session) {
		User user = new User();
		user = userService.checkUserWithUsernameandPasswordandIdentity(l_username, l_password, l_identity);
		if (user != null) {
			Date date = new Date();
			// 得到一个Timestamp格式的时间，存入mysql中的时间格式“yyyy/MM/dd HH:mm:ss”
			Timestamp timeStamp = new Timestamp(date.getTime());
			user.setDatetime(timeStamp);
			session.setAttribute("UserInfo", user);
			return "OK";
		} else {
			return "FAIL";
		}
	}

	@RequestMapping(value = "/bbs/adminlogin.action", method = RequestMethod.POST)
	@ResponseBody
	public String adminlogin(String l_username, String l_password, String l_identity, HttpSession session,
			Model model) {
		User user = new User();
		user = userService.checkUserWithUsernameandPasswordandIdentity(l_username, l_password, l_identity);
		if (user != null) {
			Date date = new Date();
			// 得到一个Timestamp格式的时间，存入mysql中的时间格式“yyyy/MM/dd HH:mm:ss”
			Timestamp timeStamp = new Timestamp(date.getTime());
			user.setDatetime(timeStamp);
			session.setAttribute("AdminInfo", user);
			return "OK";
		}
		return "FAIL";
	}

	@RequestMapping(value = "/bbs/topublish_0.action", method = RequestMethod.GET)
	public String topublish_0(@RequestParam(defaultValue = "1") Integer page,
			@RequestParam(defaultValue = "5") Integer row, String publishArticleEditorNo, String publishArticleType,
			String limitedstr, Model model) {

		List<BaseDict> article_editorNo = baseDictDao.findBaseDictListWithTypeCode(ARTICLE_EDITORNO);
		List<BaseDict> article_type = baseDictDao.findBaseDictListWithTypeCode(ARTICLE_TYPE);
		model.addAttribute("article_editorNo", article_editorNo);
		model.addAttribute("article_type", article_type);

		model.addAttribute("publishArticleEditorNo", publishArticleEditorNo);
		model.addAttribute("publishArticleType", publishArticleType);
		if (limitedstr != null) {
			Page<Article> rootarticles = new Page<>();
			rootarticles = articleService.findLimitedArticleList(page, row, 0, limitedstr);
			model.addAttribute("rootarticles", rootarticles);
		} else {
			Page<Article> rootarticles = new Page<>();
			rootarticles = articleService.findArticleListByRootid(page, row, 0);
			model.addAttribute("rootarticles", rootarticles);
		}
		return "publish_0";
	}

	@RequestMapping(value = "/bbs/userregist.action", method = RequestMethod.POST)
	@ResponseBody
	public String userregist(Integer securityscores,String pswstrength,String r_username, String r_password, String telephone, String r_identity,
			HttpSession session) {
		User user1 = new User();
		user1 = userService.selectUserByUsername(r_username);
		if (user1 != null) {
			// session.setAttribute("msg","该账号已注册！请重新换一个账号注册！");
			return "FAIL";
		} else {
			User user2 = new User();
			user2.setUsername(r_username);
			user2.setPassword(r_password);
			user2.setTelephone(telephone);
			if("common".equals(r_identity)){
				user2.setHeadicon("upload/beauty.png");
			}else if("admin".equals(r_identity)){
				user2.setHeadicon("upload/flycoon.jpg");
			}
			
			user2.setIdentity(r_identity);
			Integer num = userService.addOneUser(user2);
			
			if("common".equals(r_identity)){
				//封装CurrentStates对象
				User userTemp=new User();
				userTemp=userService.selectUserByUsername(r_username);
				CurrentStates currentStates=new CurrentStates();
				currentStates.setUserId(userTemp.getId());
				currentStates.setUsername(r_username);
				currentStates.setSecurityscores(securityscores);
				currentStates.setPswstrength(pswstrength);
				currentStates.setMobileidenstate(0);
				currentStates.setMobileiden("未绑定");
				currentStates.setLasttimeenter("上次登陆时间地址待核实中...");
				currentStates.setEmailidenstate(0);
				currentStates.setEmailiden("未绑定");
				//在t_currentstates表中插入相关的一条记录
				currentStatesService.addCurrentStates(currentStates);
			}
			
			if (num > 0) {
				return "OK";
			} else {
				return "FAIL";
			}
		}
	}

	@RequestMapping(value = "/bbs/isLogin.action", method = RequestMethod.POST)
	@ResponseBody
	public Article isLogin(Integer id, HttpSession session) {

		Article article = articleService.selectArticleById(id);
		return article;
	}

	@RequestMapping(value = "/bbs/userlogout.action", method = RequestMethod.POST)
	@ResponseBody
	public String logout(HttpSession session) {
		session.removeAttribute("UserInfo");
		// 清除Session
		session.invalidate();
		// 重定向到登录页面的跳转方法
		return "OK";
	}
	@RequestMapping(value = "/bbs/autologout.action", method = RequestMethod.GET)
	public String autologout(HttpSession session) {
		session.removeAttribute("UserInfo");
		// 清除Session
		session.invalidate();
		// 重定向到登录页面的跳转方法
		return "redirect:list.action";
	}

	@RequestMapping(value = "/bbs/adminlogout.action", method = RequestMethod.GET)
	public String adminlogout(HttpSession session) {
		session.removeAttribute("AdminInfo");
		session.invalidate();
		return "redirect:/bbs/list.action";
	}

	@RequestMapping(value = "/bbs/Personal_Header.action")
	public String toPersonal_HeaderPage() {
		return "Personal_Header";
	}

	@RequestMapping(value = "/bbs/Basic_Information.action")
	public String toBasic_Information(String industry,Model model,HttpServletRequest req) {
		
		User user=(User) req.getSession().getAttribute("UserInfo");
		if(user!=null) {
			BasicInformation basicInformation=basicInformationService.selectBasicInformation(user.getUsername());
			if(basicInformation!=null){
				req.setAttribute("basicInfo", basicInformation);
			}
		}
		
		List<BaseDict> industryinfo = baseDictDao.findBaseDictListWithTypeCode("003");
		model.addAttribute("industryinfo",industryinfo);
		model.addAttribute("industry",industry);
		return "Basic_Information";
	}

	@RequestMapping(value = "/bbs/Contract_Information.action")
	public String toContract_Information(HttpServletRequest req) {
		User user=(User) req.getSession().getAttribute("UserInfo");
		if(user!=null) {
			ContractInformation ContractInfo=contractInformationService.selectContractInformation(user.getUsername());
			if(ContractInfo!=null){
				req.setAttribute("ContractInfo", ContractInfo);
			}
		}
		return "Contract_Information";
	}

	@RequestMapping(value = "/bbs/CurrentStates.action")
	public String toCurrentStates(HttpServletRequest req) {
		User user=(User)req.getSession().getAttribute("UserInfo");
		if(user!=null) {
			CurrentStates currentStates=currentStatesService.selectCurrentStates(user.getUsername());
			req.setAttribute("currentStates", currentStates);
		}
		return "CurrentStates";
	}

	@RequestMapping(value = "/bbs/Education_Information.action")
	public String toEducation_Information(HttpServletRequest req) {
		User user=(User) req.getSession().getAttribute("UserInfo");
		if(user!=null){
			EducationInformation educationInfo=new EducationInformation();
			educationInfo=educationInformationService.selectEducationInformation(user.getUsername());
			if(educationInfo!=null){
				req.setAttribute("educationInfo", educationInfo);
			}
		}
		return "Education_Information";
	}

	@RequestMapping(value = "/bbs/EmailBind.action")
	public String toEmailBind(HttpServletRequest req) {
		User user=(User)req.getSession().getAttribute("UserInfo");
		if(user!=null) {
			CurrentStates currentStates=currentStatesService.selectCurrentStates(user.getUsername());
			req.setAttribute("currentStates", currentStates);
		}
		return "EmailBind";
	}

	@RequestMapping(value = "/bbs/ExperienceValue.action")
	public String toExperienceValue() {
		return "ExperienceValue";
	}

	@RequestMapping(value = "/bbs/MobileBindQuestion.action")
	public String toMobileBindQuestion(HttpServletRequest req) {
		User user=(User)req.getSession().getAttribute("UserInfo");
		if(user!=null) {
			CurrentStates currentStates=currentStatesService.selectCurrentStates(user.getUsername());
			req.setAttribute("currentStates", currentStates);
		}
		return "MobileBindQuestion";
	}
	
	@RequestMapping(value="/bbs/MobileBind.action")
	public String toMobileBind(){
		return "MobileBind";
	}

	@RequestMapping(value = "/bbs/PasswordUpdate.action")
	public String toPasswordUpdate() {
		return "PasswordUpdate";
	}
	@RequestMapping(value = "/bbs/PasswordDoUpdate.action")
	@ResponseBody
	public String toPasswordUpdate(String oldPassword,String newPassword,HttpServletRequest req) {
		User user=(User)req.getSession().getAttribute("UserInfo");
		if(user!=null&&oldPassword.equals(user.getPassword())){
			User userTemp=new User();
			userTemp.setUsername(user.getUsername());
			userTemp.setPassword(newPassword);
			userTemp.setIdentity(user.getIdentity());
			userTemp.setTelephone(user.getTelephone());
			userTemp.setHeadicon(user.getHeadicon());
			userTemp.setDatetime(user.getDatetime());
			Integer count=userService.updateUser(userTemp);
			if(count>0){
				return "OK";
			}else{
				return "FAIL";
			}
		}
		return "FAIL";
	}

	// 上传头像
	/**
	 * 执行文件上传
	 * 
	 * @throws Exception
	 */
	@RequestMapping("/bbs/fileUpload.action")
	@ResponseBody
	public String handleFormUpload(@RequestParam("avatar_data") String avatar_data,
			@RequestParam("avatar_file") List<MultipartFile> uploadfile, HttpServletRequest request) throws Exception {
		String newFilename = null;
		String dirPath = null;
		// 判断所上传文件是否存在
		if (!uploadfile.isEmpty() && uploadfile.size() > 0) {
			// 循环输出上传的文件
			for (MultipartFile file : uploadfile) {
				// 获取上传文件的原始名称
				String originalFilename = file.getOriginalFilename();
				// 获取上传人/用户的账号
				HttpSession session = request.getSession();
				User user = (User) session.getAttribute("UserInfo");
				String name = user.getUsername();
				byte[] nameencode=name.getBytes("UTF-8");
				String nameencodestr="";
				int i=0;
				for(i=0;i<nameencode.length;i++){
					nameencodestr=nameencodestr+nameencode[i]+"_";
				}
				i--;
				//在最后加上字节数组元素的个数
				nameencodestr=nameencodestr+i+"_";
				// 设置上传文件的保存地址目录
				String fileUploadPath = "upload/" + nameencodestr + "/";
				dirPath = request.getServletContext().getRealPath("/" + fileUploadPath)+"\\";
				File filePath = new File(dirPath);
				// 如果保存文件的地址不存在，就先创建目录，否则将目录下已经存在的所有文件先删除以避免不用的头像图片占用服务器内存
				if (!filePath.exists()) {
					filePath.mkdirs();
				} else {
					for (File allfile : filePath.listFiles()) {
						if (allfile.isFile()) {
							allfile.delete();
						}
					}
				}

				// 使用UUID重新命名上传的文件名称(上传人_uuid_原始文件名称)
				newFilename = nameencodestr + "_" + UUID.randomUUID() + "_" + originalFilename;
				User usertemp = new User();
				usertemp.setUsername(name);
				usertemp.setPassword(user.getPassword());
				usertemp.setIdentity(user.getIdentity());
				usertemp.setTelephone(user.getTelephone());
				usertemp.setDatetime(user.getDatetime());
				usertemp.setHeadicon(fileUploadPath + newFilename);
				userService.updateUser(usertemp);
				
				List<Article> articles=articleService.selectArticleListByUsername(name);
				for(Article article : articles){
					article.setWheadicon(fileUploadPath + newFilename);
					articleService.updateArticle(article);
				}
				try {
					// 使用MultipartFile接口的方法完成文件上传到指定位置
					file.transferTo(new File(dirPath + newFilename));
				} catch (Exception e) {
					e.printStackTrace();
					JSONObject json = new JSONObject();
					json.put("error", "error");
					return json.toString();
				}
			}
			int x, y, w, h, angle;

			@SuppressWarnings("static-access")
			JSONObject jsonObject = new JSONObject().fromObject(avatar_data);
			String x_valuestr = jsonObject.get("x").toString();
			String y_valuestr = jsonObject.get("y").toString();
			String w_valuestr = jsonObject.get("width").toString();
			String h_valuestr = jsonObject.get("height").toString();
			String rotate_valuestr = jsonObject.get("rotate").toString();

			x = x_valuestr.indexOf(".") > -1 ? Integer.valueOf(x_valuestr.substring(0, x_valuestr.indexOf(".")))
					: Integer.valueOf(x_valuestr);
			y = y_valuestr.indexOf(".") > -1 ? Integer.valueOf(y_valuestr.substring(0, y_valuestr.indexOf(".")))
					: Integer.valueOf(y_valuestr);
			w = w_valuestr.indexOf(".") > -1 ? Integer.valueOf(w_valuestr.substring(0, w_valuestr.indexOf(".")))
					: Integer.valueOf(w_valuestr);
			h = h_valuestr.indexOf(".") > -1 ? Integer.valueOf(h_valuestr.substring(0, h_valuestr.indexOf(".")))
					: Integer.valueOf(h_valuestr);
			angle = rotate_valuestr.indexOf(".") > -1
					? Integer.valueOf(rotate_valuestr.substring(0, rotate_valuestr.indexOf(".")))
					: Integer.valueOf(rotate_valuestr);

			CutImageUtils.cutImage(dirPath + newFilename, x, y, w, h, angle);
			// 返回前台
			JSONObject json = new JSONObject();
			json.put("success", "success");
			return json.toString();
		} else {
			JSONObject json = new JSONObject();
			json.put("error", "error");
			return json.toString();
		}
	}
}
