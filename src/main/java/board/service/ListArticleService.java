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
		int startRow = 1 + countPerPage * (pageNo - 1); // 1, 11, 21, ... , 1 + 10(n-1)
		int endRow = pageNo * countPerPage; // 10, 20, 30, ... 10n
		List<BoardVO> mList = BoardDao.getInstance().selectList(startRow, endRow);
		return mList;
	}

	// 페이지의 총 개수 구하기
	public int getTotalCount() throws BoardException {
		// 총 레코드(글)의 개수 totalRecordCount
		totalRecordCount = BoardDao.getInstance().getTotalCount();
		// 총 페이지수 -> 총 개수 / 페이지당 개수 12 / 10 -> 1 => 그러나 2페이지까지 있어야함
		totalPageCount = totalRecordCount / countPerPage;
		//
		if (totalRecordCount % countPerPage != 0) totalPageCount++;
		return totalPageCount;
	}
		
}
