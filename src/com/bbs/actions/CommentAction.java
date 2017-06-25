package com.bbs.actions;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.interceptor.ServletRequestAware;

import com.bbs.entities.Book;
import com.bbs.entities.Comment;
import com.bbs.entities.User;
import com.bbs.services.CommentService;
import com.opensymphony.xwork2.ModelDriven;


public class CommentAction extends BaseAction implements ModelDriven<Comment>,ServletRequestAware{
	private static final long serialVersionUID = 1L;
	private CommentService commentService;
	private Comment comment;
	private Map<String, Object> status;
	private HttpServletRequest httpServletRequest;
	
	public void setStatus(Map<String, Object> status) {
		this.status = status;
	}

	public Map<String, Object> getStatus() {
		return status;
	}

	public void setCommentService(CommentService commentService) {
		this.commentService = commentService;
	}

	public String makeComment() {
		String content = httpServletRequest.getParameter("content");
		String starClass = httpServletRequest.getParameter("starClass");
		comment.setContent(content);
		comment.setStarClass(Integer.valueOf(starClass));
		comment.setBook((Book)session.get("book"));
		comment.setUser((User)session.get("user"));
		comment.setState("unselected");
		status = new HashMap<String, Object>();
		if (commentService.makeComment(comment)) {
			status.put("state", 1);
		}
		else{
			status.put("state", 2);
		}
		return "comment";
	}

	@Override
	public Comment getModel() {
		return comment;
	}

	public void prepareMakeComment() {
		comment = new Comment();
	}

	@Override
	public void setServletRequest(HttpServletRequest request) {
		httpServletRequest = request;
	}

}
