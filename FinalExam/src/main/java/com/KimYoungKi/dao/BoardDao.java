package com.KimYoungKi.dao;


import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.session.SqlSession;

import com.KimYoungKi.DBUtil.DBUtil;
import com.KimYoungKi.model.BoardModel;
import com.KimYoungKi.model.ItemModel;
import com.KimYoungKi.model.UserModel;

public class BoardDao {
	
private SqlSession sqlSession;

	public BoardDao()
	{
		sqlSession = DBUtil.getSqlSession();
	}

	


	public List<BoardModel> getBoardList(HashMap<String, String> hashmap) {
		
		
		DBUtil.closeSqlSession(sqlSession);
		sqlSession = DBUtil.getSqlSession();
		
		HashMap<String, String> tmp = new HashMap<>();
		
		
		
		String search = hashmap.get("search");
		
	
		String newsearch = "%"+search+"%";	
		int pageNumber = Integer.parseInt(hashmap.get("pageNumber"));
		
		int a = pageNumber*10-10;
		int b = pageNumber*10+1;
		
		tmp.put("search", newsearch);
		tmp.put("a", Integer.toString(a));
		tmp.put("b", Integer.toString(b));
		
		return sqlSession.selectList("BoardMapper.getBoardList",tmp);
		
		
	}

	public boolean nextPage(HashMap<String, String> hashmap)
	{
		
		
		DBUtil.closeSqlSession(sqlSession);
		sqlSession = DBUtil.getSqlSession();
		
		HashMap<String, String> tmp = new HashMap<>();
		
		
		
		String search = hashmap.get("search");
		
		
		String newsearch = "%"+search+"%";	
		int pageNumber = Integer.parseInt(hashmap.get("pageNumber"));
		
		int a = pageNumber*10-10;
		int b = pageNumber*10+1;
		
	
		tmp.put("search", newsearch);
		tmp.put("a", Integer.toString(a));
		tmp.put("b", Integer.toString(b));
		
		
		if(sqlSession.selectList("BoardMapper.nextPage",tmp).size() != 0)
		{
			
			return true;
		}
		else
		{
			
			return false;
		}
	}



	public int delete(@Param("boardID")String boardID) 
	{
		DBUtil.closeSqlSession(sqlSession);
		sqlSession = DBUtil.getSqlSession();
	
		int result = -1;
		
		if(boardID != null)
		{
		 result = sqlSession.delete("BoardMapper.delete",boardID);
		 sqlSession.commit();
		}
		
		return result;
		

	}




	public int getNext()
	{
		DBUtil.closeSqlSession(sqlSession);
		sqlSession = DBUtil.getSqlSession();
		
		if(sqlSession.selectOne("BoardMapper.getNext") == null)
		{
			return 0;
		}
		else
		{
			return sqlSession.selectOne("BoardMapper.getNext");
		}
	}




	public String getDate() 
	{
		DBUtil.closeSqlSession(sqlSession);
		sqlSession = DBUtil.getSqlSession();
		
		return sqlSession.selectOne("BoardMapper.getDate");
	}




	public int boardWrite(BoardModel board)
	{
		DBUtil.closeSqlSession(sqlSession);
		sqlSession = DBUtil.getSqlSession();
		
		int result = sqlSession.insert("BoardMapper.boardWrite",board);
		sqlSession.commit();	
		
		
		return result;
		
	}
	
	
	
	
}
