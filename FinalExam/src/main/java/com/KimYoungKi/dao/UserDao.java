package com.KimYoungKi.dao;


import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.session.SqlSession;

import com.KimYoungKi.DBUtil.DBUtil;
import com.KimYoungKi.model.Item;
import com.KimYoungKi.model.User;

public class UserDao {
	
private SqlSession sqlSession;

	public UserDao()
	{
		sqlSession = DBUtil.getSqlSession();
	}

	public int login(@Param("userID")String userID, @Param("userPassword")String userPassword) 
	{
		
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
		
		int result = -1;
		
		if(userID != null)
		{
		 result = sqlSession.selectOne("UserMapper.getOpCode",userID);
		}
		
		return result;
	}


	public List<?> getItemList(HashMap<String, String> hashmap) {
		
		
		HashMap<String, String> tmp = new HashMap<>();
		
		
		String category = hashmap.get("category");
		String search = hashmap.get("search");
		
		String newcategory = "%"+category+"%";	
		String newsearch = "%"+search+"%";	
		int pageNumber = Integer.parseInt(hashmap.get("pageNumber"));
		
		int a = pageNumber*10-10;
		int b = pageNumber*10+1;
		
		tmp.put("category", newcategory);
		tmp.put("search", newsearch);
		tmp.put("a", Integer.toString(a));
		tmp.put("b", Integer.toString(b));
		
		System.out.println(search);
		
		return sqlSession.selectList("UserMapper.getItemList",tmp);
		
		
	}

	public boolean nextPage(HashMap<String, String> hashmap)
	{
		
		
		
		
		HashMap<String, String> tmp = new HashMap<>();
		
		
		String category = hashmap.get("category");
		String search = hashmap.get("search");
		
		String newcategory = "%"+category+"%";	
		String newsearch = "%"+search+"%";	
		int pageNumber = Integer.parseInt(hashmap.get("pageNumber"));
		
		int a = pageNumber*10-10;
		int b = pageNumber*10+1;
		
		tmp.put("category", newcategory);
		tmp.put("search", newsearch);
		tmp.put("a", Integer.toString(a));
		tmp.put("b", Integer.toString(b));
		
		
		
		if(sqlSession.selectList("UserMapper.nextCategoryPage",tmp).size() != 0)
		{
			
			return true;
		}
		else
		{
			
			return false;
		}
	}

	
	
	
	
}
