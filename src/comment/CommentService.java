package comment;

import java.util.List;


public class CommentService {
	CommentDAO commentDAO;
	
	public CommentService() {
		commentDAO = new CommentDAO();
	}
	
	public List<CommentVO> getCommentList(int boardCategoryNo, int boardNo){
		return commentDAO.getCommentList(boardCategoryNo, boardNo);
	}

	public int insertComment(CommentVO commentVO) {
		return commentDAO.insertComment(commentVO);
		
	}

	public int updateComment(int commentNo, String userId, String updateContent) {
		return commentDAO.updateComment(commentNo, userId, updateContent);
	}
	
	public int deleteComment(int commentNo, String userId) {
		return commentDAO.deleteComment(commentNo, userId);		
	}

	public CommentVO getLastComment() {
		return commentDAO.getLastComment();
	}
	
}
