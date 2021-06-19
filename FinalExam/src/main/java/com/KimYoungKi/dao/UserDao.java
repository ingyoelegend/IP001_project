package com.KimYoungKi.dao;


import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.session.SqlSession;

import com.KimYoungKi.DBUtil.DBUtil;
import com.KimYoungKi.model.ItemModel;
import com.KimYoungKi.model.UserModel;

public class UserDao {
	
private SqlSession sqlSession;

	public UserDao()
	{
		sqlSession = DBUtil.getSqlSession();
	}

	public int login(@Param("userID")String userID, @Param("userPassword")String userPassword) 
	{
		
		DBUtil.closeSqlSession(sqlSession);
		sqlSession = DBUtil.getSqlSession();
		
		String result = sqlSession.selectOne("UserMapper.login",userID);
		
		
		
		if(result != null)
		{
			if(result.equals(userPassword))
			{
				return 1;
			}
			else if(!result.equals(userPassword))
			{
				return 0;
			}
		}
		
		
		
		return -1;
		
	}

	public int getOpCode(@Param("userID")String userID) 
	{
		
		DBUtil.closeSqlSession(sqlSession);
		sqlSession = DBUtil.getSqlSession();
		
		int result = -1;
		
		if(userID != null)
		{
		 result = sqlSession.selectOne("UserMapper.getOpCode",userID);
		}
		
		return result;
	}


	public int delete(@Param("userID")String userID) 
	{
		DBUtil.closeSqlSession(sqlSession);
		sqlSession = DBUtil.getSqlSession();
	
		int result = -1;
		
		if(userID != null)
		{
		 result = sqlSession.delete("UserMapper.delete",userID);
		 sqlSession.commit();
		}
		
		return result;
		

	}

	public int changeOpCode(HashMap<String, String> hashmap)
	{
		
		DBUtil.closeSqlSession(sqlSession);
		sqlSession = DBUtil.getSqlSession();
		
		int result = sqlSession.update("UserMapper.changeOpCode",hashmap);
		sqlSession.commit();
		return result;
	}

	public int join(UserModel user)
	{
		DBUtil.closeSqlSession(sqlSession);
		sqlSession = DBUtil.getSqlSession();
		
		int result = sqlSession.insert("UserMapper.join",user);
		sqlSession.commit();
		return result;
		
				
	}

	
	public String getName(@Param("userID")String userID) 
	{
		
		DBUtil.closeSqlSession(sqlSession);
		sqlSession = DBUtil.getSqlSession();
		
		
		return sqlSession.selectOne("UserMapper.getName",userID);
	}
	
	
	
	
}
