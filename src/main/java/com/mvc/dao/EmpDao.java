package com.mvc.dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;

import com.mvc.beans.Emp;

public class EmpDao {
	JdbcTemplate template;  
	  
	
	
	public void setTemplate(JdbcTemplate template) {  
	    this.template = template;  
	}  
	public int save(Emp p){  
	    String sql="insert into Empol values(?,?,?,?)";  
	    return template.update(sql, new Object[] {p.getId(),p.getName(),p.getDesignation(),p.getSalary()});  
	}  
	public int update(Emp p){  
	    String sql="update Empol set name=?, salary=?, designation=? where id=? ";  
	    return template.update(sql,new Object[] {p.getName(),p.getSalary(), p.getDesignation(), p.getId()});  
	}  
	public int delete(int id){  
	    String sql="delete from Empol where id="+id+"";  
	    return template.update(sql);  
	} 

	
	public Emp getEmpById(int id){  
	    String sql="select * from Empol where id=?";  
	   return template.queryForObject(sql, new Object[]{id},new BeanPropertyRowMapper<Emp>(Emp.class));  

	    
	}  
	public List<Emp> getEmployees(){  
	    return template.query("select * from Empol",new RowMapper<Emp>(){  
	        public Emp mapRow(ResultSet rs, int row) throws SQLException {  
	            Emp e=new Emp();  
	            e.setId((long) rs.getInt(1));  
	            e.setName(rs.getString(2));  
	            e.setSalary(rs.getString(3));  
	            e.setDesignation(rs.getString(4));  
	            return e;  
	        }  
	    });  
	
	    
	}  
	
	
}
