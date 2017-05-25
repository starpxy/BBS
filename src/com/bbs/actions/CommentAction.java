package com.bbs.actions;

import com.bbs.entities.Book;
import com.bbs.entities.Comment;
import com.bbs.entities.User;
import com.bbs.services.CommentService;
import com.opensymphony.xwork2.ModelDriven;

public class CommentAction extends BaseAction implements ModelDriven<Comment> {
	private static final long serialVersionUID = 1L;
	private CommentService commentService;
	private Comment comment;

	public void setCommentService(CommentService commentService) {
		this.commentService = commentService;
	}

	public String createComment() {
		comment.setUser((User) session.get("user"));
		comment.setBook((Book) session.get("book"));
		System.out.println(((Book) session.get("book")).getBookTitle());
		commentService.createComment(comment);
		request.put("comment", comment);
		return "comment";
	}

	@Override
	public Comment getModel() {
		return comment;
	}

	public void prepareCreateComment() {
		comment = new Comment();
	}

}
