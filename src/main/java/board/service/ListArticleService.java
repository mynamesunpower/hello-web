package board.service;

import board.model.BoardDao;
import board.model.BoardException;
import board.model.BoardVO;

import java.util.List;

public class ListArticleService {
	private static ListArticleService instance;
	public static ListArticleService getInstance()  throws BoardException{
		if( instance == null )
		{
			instance = new ListArticleService();
		}
		return instance;
	}
	
	public List <BoardVO> getArticleList() throws BoardException
	{
		// 
		 List <BoardVO> mList = BoardDao.getInstance().selectList();
		return mList;
	}
		
}
