package com.example.dao;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.namedparam.MapSqlParameterSource;
import org.springframework.jdbc.core.namedparam.NamedParameterJdbcTemplate;
import org.springframework.stereotype.Repository;

import com.example.entity.ErrorList;

@Repository
public class ErrorListDao {

	@Autowired
	private NamedParameterJdbcTemplate jdbcTemplate;
	
	public List<ErrorList> find(String keyword){
		
		String sql = """
						select e.id
						, e.category_id 
						,e.error_list
						, c.id category_id
						, c.name category_name 
						from error_list e
						join categories c 
						on e.category_id = c.id 
						where e.error_list || c.name like '%' || :keyword || '%' 
						order by e.id;
				""";
		MapSqlParameterSource param = new MapSqlParameterSource();
		param.addValue("keyword", keyword);
		
		List<ErrorList> list = jdbcTemplate.query(sql, param, new BeanPropertyRowMapper<ErrorList>(ErrorList.class));

		System.out.println(list.get(0).getCategory().getName());
		System.out.println(list.get(0).getErrorList());
		
		return jdbcTemplate.query(sql, param, new BeanPropertyRowMapper<ErrorList>(ErrorList.class));
	}
}
