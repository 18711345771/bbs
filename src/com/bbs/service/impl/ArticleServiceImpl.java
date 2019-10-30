package com.bbs.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bbs.dao.ArticleDao;
import com.bbs.po.Article;
import com.bbs.service.ArticleService;
import com.bbs.utils.Page;
@Service("articleService")
public class ArticleServiceImpl implements ArticleService {
	
	@Autowired
	ArticleDao articleDao;

	@Override
	public Article selectArticleById(Integer id) {
		Article article=articleDao.selectArticleById(id);
		return article;
	}
	
	@Override
	public Page<Article> findArticleListByPid(Integer page,Integer row,Integer pid) {
		
		Article article=new Article();
		article.setPid(pid);
		article.setStart(row*(page-1));
		article.setRows(row);
		List<Article> articles=articleDao.selectArticleListByPid(article);
		Integer count =articleDao.selectArticleCountByPid(pid);
		Page<Article> results=new Page<>();
		results.setPage(page);
		results.setRows(articles);
		results.setSize(row);
		results.setTotal(count);
		return results;
	}
	
	@Override
	public Integer addArticle(Article article) {
		return articleDao.addArticle(article);
	}

	@Override
	public Integer updateArticle(Article article) {
		return articleDao.updateArticle(article);
	}

	@Override
	public Page<Article> findArticleListByRootid(Integer page, Integer row, Integer rootid) {
		
		Article article=new Article();
		article.setRootid(rootid);
		article.setStart(row*(page-1));
		article.setRows(row);
		List<Article> articles=articleDao.selectArticleListByRootid(article);
		Integer count =articleDao.selectArticleCountByRootid(rootid);
		Page<Article> results=new Page<>();
		results.setPage(page);
		results.setRows(articles);
		results.setSize(row);
		results.setTotal(count);
		return results;
	}

	@Override
	public Integer deleteArticle(Article article) {
		return articleDao.deleteArticle(article);
	}

	@Override
	public Page<Article> findPersonArticleList(Integer page, Integer row,String writer) {
		Article article=new Article();
		article.setWriter(writer);
		
		article.setStart(row*(page-1));
		article.setRows(row);
		List<Article> articles=articleDao.selectPersonArticleList(article);
		Integer count =articleDao.selectPersonArticleCount(article);
		Page<Article> results=new Page<>();
		results.setPage(page);
		results.setRows(articles);
		results.setSize(row);
		results.setTotal(count);
		return results;
	}

	@Override
	public Page<Article> findLimitedArticleList(Integer page, Integer row,Integer rootid,String limitedstr) {
		Article article=new Article();
		article.setRootid(rootid);
		
		article.setTitle(limitedstr);
		//ע��˴�����Ĳ����ַ���ţ������ַ�����ע��ת��
		article.setEditorNo(limitedstr);
		
		article.setType(limitedstr);
		article.setStart(row*(page-1));
		article.setRows(row);
		List<Article> articles=articleDao.selectLimitedArticleList(article);
		Integer count =articleDao.selectLimitedArticleCount(article);
		Page<Article> results=new Page<>();
		results.setPage(page);
		results.setRows(articles);
		results.setSize(row);
		results.setTotal(count);
		return results;
	}

	@Override
	public Integer updatePersonArticle(Article article) {
		return articleDao.updatePersonArticle(article);
	}

	@Override
	public List<Article> selectArticleListByUsername(String username) {
		return articleDao.selectArticleListByUsername(username);
	}

}
