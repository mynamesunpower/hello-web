package mvc.board.command;

import mvc.board.model.BoardDao;
import mvc.board.model.BoardException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class CommandDelete implements Command {
	private String nextPage;

	public CommandDelete (String nextPage) {
		this.nextPage = nextPage;
	}

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws CommandException {
		try {
			int articleId = Integer.parseInt(request.getParameter("id"));
			String password = request.getParameter("password");

			request.setAttribute("result", BoardDao.getInstance().delete(articleId, password));

			return nextPage;
		} catch (BoardException e) {
			throw new CommandException("CommandDelete.java 삭제 에러:" + e.getMessage());
		}
	}
}
