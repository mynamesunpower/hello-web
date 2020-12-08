package mybatis.guest.service;

import mybatis.guest.model.Comment;
import mybatis.guest.session.CommentRepository;

import java.util.List;

public class CommentService {
	
	private static CommentService service;
	
	private CommentService() {}
	public static CommentService getInstance(){
		if( service == null) service = new CommentService();
		return service;
	}

	private CommentRepository commentRepository = new CommentRepository();

	public List<Comment> selectComment() {
		return commentRepository.selectComment();
	}

	public Integer insertComment(Comment comment) {
		return commentRepository.insertComment(comment);
	}

	public Comment selectCommentByPrimaryKey(long commentNo) {
		return commentRepository.selectCommentByPrimaryKey(commentNo);
	}

	public Integer modifyComment(Comment comment){
		return commentRepository.modifyComment(comment);
	}

	public Integer deleteComment(Comment comment) {
		return commentRepository.deleteComment(comment);
	}
}