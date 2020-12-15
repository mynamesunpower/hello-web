package mvc.board.command;

import mvc.board.model.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class CommandModify implements Command {

	private String nextPage;

	public CommandModify (String nextPage) {
		this.nextPage = nextPage;
	}

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws CommandException {
		try {
			BoardVO article = new BoardVO();
			int articleId = Integer.parseInt(request.getParameter("articleId"));
			article.setTitle(request.getParameter("title"));
			article.setContent(request.getParameter("content"));
			article.setArticleId(articleId);
			article.setPassword(request.getParameter("password"));

			request.setAttribute("result", BoardDao.getInstance().update(article));
			request.setAttribute("articleId", articleId);
			return nextPage;
		} catch (BoardException e) {
			throw new CommandException("CommandModify.java 수정 에러: " + e.getMessage());
		}
	}
}
