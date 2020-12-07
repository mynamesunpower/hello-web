package board.service;

import board.model.BoardDao;
import board.model.BoardException;
import board.model.BoardVO;

import java.util.List;

public class ListArticleService {
	private int totalRecordCount; // 총 레코드 갯수
	private int totalPageCount; // 총 페이지 갯수
	private int countPerPage = 10; // 페이지당 레코드 갯수

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

	public List <BoardVO> getArticleList(int pageNo) throws BoardException {
		// 해당 페이지 레코드를 검색해 온다면
		/** 페이지번호 시작레코드번호 끝레코드번호 (페이지당 3개 보여준다면)
		 *      1       1           10
		 *      2       11          20
		 *      3       21	        30
		 *      4       31          40
		 */
		int startRow = 1 + 10 * (pageNo - 1); // 1, 11, 21, ... , 1 + 10(n-1)
		int endRow = pageNo * countPerPage; // 10, 20, 30, ... 10n
		List<BoardVO> mList = BoardDao.getInstance().selectList(startRow, endRow);
		return mList;
	}

	public int getTotalCount() throws BoardException {
		totalRecordCount = BoardDao.getInstance().getTotalCount();
		totalPageCount = totalRecordCount / countPerPage;
		if (totalRecordCount % countPerPage != 0) totalPageCount++;
		return totalPageCount;
	}
		
}
