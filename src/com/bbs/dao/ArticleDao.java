package com.bbs.dao;

import java.util.List;

import com.bbs.po.Article;

public interface ArticleDao {
	public Article selectArticleById(Integer id);//
	public Integer selectArticleCountByPid(Integer pid);//
	public Integer selectArticleCountByRootid(Integer rootid);//
	public List<Article> selectPersonArticleList(Article article);//
	public List<Article> selectArticleListByPid(Article article);//
	public List<Article> selectArticleListByRootid(Article article);//
	
	public List<Article> selectArticleListByUsername(String username);//根据用户名查找自己发表的所有帖子
	
	public List<Article> selectLimitedArticleList(Article article);
	public Integer selectLimitedArticleCount(Article article);
	
	public Integer selectPersonArticleCount(Article article);//
	public Integer addArticle(Article article);
	public Integer updateArticle(Article article);
	public Integer updatePersonArticle(Article article);
	public Integer deleteArticle(Article article);
}
