package mvc.board.command;

import mvc.board.model.BoardDao;
import mvc.board.model.BoardException;
import mvc.board.model.BoardVO;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class CommandView implements Command {
	private String nextPage;

	public CommandView (String nextPage) {
		this.nextPage = nextPage;
	}

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws CommandException {
		try {
			int articleId = Integer.parseInt(request.getParameter("id"));
			BoardVO article = BoardDao.getInstance().selectById(articleId);
			request.setAttribute("article", article);
		} catch (BoardException e) {
			throw new CommandException("CommandView.java 오류:" + e.getMessage());
		}
		return nextPage;
	}
}

