package com.bbs.actions;

import java.util.HashMap;
import java.util.Map;

import com.bbs.entities.Book;
import com.bbs.entities.Comment;
import com.bbs.entities.User;
import com.bbs.services.CommentService;
import com.opensymphony.xwork2.ModelDriven;

import net.sf.json.JSONObject;

public class CommentAction extends BaseAction implements ModelDriven<Comment> {
	private static final long serialVersionUID = 1L;
	private CommentService commentService;
	private Comment comment;
	private Map<String, Object> status;
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
		comment.setUser((User) session.get("user"));
		comment.setBook((Book) session.get("book"));
		commentService.makeComment(comment);
		request.put("comment", comment);
		status = new HashMap<String,Object>();
		status.put("state", 1);
		return "comment";
	}

	@Override
	public Comment getModel() {
		return comment;
	}

	public void prepareMakeComment() {
		comment = new Comment();
	}

}
