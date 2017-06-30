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

public class CommentAction extends BaseAction implements ModelDriven<Comment>, ServletRequestAware {
	private static final long serialVersionUID = 1L;
	private CommentService commentService;
	private Comment comment;
	private Map<String, Object> status;
	private HttpServletRequest httpServletRequest;

	public void setCommentService(CommentService commentService) {
		this.commentService = commentService;
	}

	public Map<String, Object> getStatus() {
		return status;
	}

	public String deleteComment() {
		String commentId = httpServletRequest.getParameter("commentId");
		status = new HashMap<>();
		if (commentService.deleteComment(commentId)) {
			status.put("state", 1);
		} else {
			status.put("state", 2);
		}
		return "deleteComment";
	}

	public String makeComment() {
		String content = httpServletRequest.getParameter("content");
		String starClass = httpServletRequest.getParameter("starClass");
		comment.setContent(content);
		comment.setStarClass(Integer.valueOf(starClass));
		comment.setBook((Book) session.get("book"));
		comment.setUser((User) session.get("user"));
		comment.setState("unselected");
		status = new HashMap<String, Object>();
		if (commentService.makeComment(comment)) {
			status.put("state", 1);
		} else {
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
