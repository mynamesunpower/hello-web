package mybatis.guest.session;

import mybatis.guest.model.Comment;
import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import java.io.IOException;
import java.io.InputStream;
import java.util.HashMap;
import java.util.List;

public class CommentRepository 
{
	//	private final String namespace = "CommentMapper";

	private SqlSessionFactory getSqlSessionFactory() {
		
		InputStream inputStream;
		try {
			inputStream = Resources.getResourceAsStream("mybatis-config.xml");
		} catch (IOException e) {
			throw new IllegalArgumentException(e);
		}
		SqlSessionFactory sessFactory =  new SqlSessionFactoryBuilder().build(inputStream);
		return sessFactory;
	}

	/**
	 * JDBC : 연결을 담당하는 친구는 Connection class
	 * Mybatis : xml 설정파일만 만들면 SqlSession class가 연결 담당
	 * @return
	 */
	public List<Comment> selectComment() {
		SqlSession sqlSession = getSqlSessionFactory().openSession();
		try {
			return sqlSession.selectList("CommentMapper.selectCommentByPK");
		} finally {
			sqlSession.close();
			// 실제로 연결을 닫는 것이 아니라 반납하는 것임
			// mybatis는 미리 연결객체(Connection)을 몇 개 열어놓고
			// ConnectionPool을 관리함
		}
	}

	public Integer insertComment(Comment comment) {
		SqlSession sqlSession = getSqlSessionFactory().openSession();
		try {
			int result = sqlSession.insert("CommentMapper.insertComment", comment);

			if (result > 0) sqlSession.commit();
			else sqlSession.rollback();

			return result;
		} finally {
			sqlSession.close();
		}
	}

	public Comment selectCommentByPrimaryKey(long commentNo) {
		SqlSession sqlSession = getSqlSessionFactory().openSession();
		try {
			HashMap map = new HashMap();
			map.put("commentNo", commentNo);
			return sqlSession.selectOne("CommentMapper.selectCommentByPK", map);
		} finally {
			sqlSession.close();
		}
	}

	public Integer modifyComment(Comment comment) {
		SqlSession sqlSession = getSqlSessionFactory().openSession();
		try {
			int result = sqlSession.update("CommentMapper.updateComment", comment);
			if (result > 0) sqlSession.commit();
			else sqlSession.rollback();

			return result;
		} finally {
			sqlSession.close();
		}
	}

	public Integer deleteComment(Comment comment) {
		SqlSession sqlSession = getSqlSessionFactory().openSession();
		try {
			int result = sqlSession.delete("CommentMapper.deleteComment", comment);
			if (result > 0) sqlSession.commit();
			else sqlSession.rollback();
			return result;
		} finally {
			sqlSession.close();
		}
	}
}
