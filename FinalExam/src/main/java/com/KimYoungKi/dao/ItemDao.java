package com.KimYoungKi.dao;


import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.session.SqlSession;

import com.KimYoungKi.DBUtil.DBUtil;
import com.KimYoungKi.model.Item;
import com.KimYoungKi.model.User;

public class ItemDao {
	
private SqlSession sqlSession;

	public ItemDao()
	{
		sqlSession = DBUtil.getSqlSession();
	}


	public List<?> getItemList(HashMap<String, String> hashmap) {
		
		DBUtil.closeSqlSession(sqlSession);
		sqlSession = DBUtil.getSqlSession();
	
		
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
		
		return sqlSession.selectList("ItemMapper.getItemList",tmp);
		
		
	}

	public boolean nextPage(HashMap<String, String> hashmap)
	{
		DBUtil.closeSqlSession(sqlSession);
		sqlSession = DBUtil.getSqlSession();
		
		
		
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
		
		
		
		if(sqlSession.selectList("ItemMapper.nextPage",tmp).size() != 0)
		{
			
			return true;
		}
		else
		{
			
			return false;
		}
	}

	public int delete(@Param("itemID")String itemID) 
	{
		DBUtil.closeSqlSession(sqlSession);
		sqlSession = DBUtil.getSqlSession();
	
		int result = sqlSession.delete("ItemMapper.delete",itemID);
		sqlSession.commit();
		return result;
		

	}


	public int uploadItem(HashMap<String, String> hashmap) 
	{
		
		DBUtil.closeSqlSession(sqlSession);
		sqlSession = DBUtil.getSqlSession();
		
		int result = sqlSession.insert("ItemMapper.uploadItem",hashmap);
		sqlSession.commit();	
		
		
		return result;
		
	}


	public int getNext() 
	{
		
		DBUtil.closeSqlSession(sqlSession);
		sqlSession = DBUtil.getSqlSession();
		
		if(sqlSession.selectOne("ItemMapper.getNext") == null)
		{
			return 0;
		}
		else
		{
			return sqlSession.selectOne("ItemMapper.getNext");
		}
		
	}
	
	
}
