package mvc.board.command;

import mvc.board.model.BoardDao;
import mvc.board.model.BoardException;
import mvc.board.model.BoardVO;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.text.DecimalFormat;

public class CommandWrite implements Command{

	private String nextPage;

	public CommandWrite(String nextPage){
		this.nextPage = nextPage;
	}

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws CommandException{
		try {
			BoardDao boardDao = BoardDao.getInstance();
			int groupId = boardDao.getGroupId();
			DecimalFormat dformat = new DecimalFormat("0000000000"); // 순서번호(sequence_no) 지정

			BoardVO article = new BoardVO();
			article.setWriterName(request.getParameter("writerName"));
			article.setContent(request.getParameter("content"));
			article.setTitle(request.getParameter("title"));
			article.setPassword(request.getParameter("password"));
			article.setGroupId(groupId);
			article.setSequenceNo( dformat.format(groupId) + "999999");

			int articleId = BoardDao.getInstance().insert(article);
			request.setAttribute("articleId", articleId);

			return nextPage;
		} catch (BoardException e) {
			throw new CommandException("CommandWrite.java 글쓰기시 오류:" + e.getMessage());
		}
	}
}
