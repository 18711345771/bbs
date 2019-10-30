package com.bbs.service;

import java.util.List;

import com.bbs.po.Article;
import com.bbs.utils.Page;

public interface ArticleService {
	public Article selectArticleById(Integer id);
	public Page<Article> findArticleListByPid(Integer page,Integer row,Integer pid);
	public Page<Article> findArticleListByRootid(Integer page,Integer row,Integer rootid);
	public Page<Article> findPersonArticleList(Integer page,Integer row,String writer);
	
	public Page<Article> findLimitedArticleList(Integer page,Integer row,Integer rootid,String limitedstr);
	
	public Integer addArticle(Article article);
	public Integer updateArticle(Article article);
	
	public Integer updatePersonArticle(Article article);
	
	public Integer deleteArticle(Article article);
	
	public List<Article> selectArticleListByUsername(String username);
}
