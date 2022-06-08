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
		
		return jdbcTemplate.query(sql, param, new BeanPropertyRowMapper<ErrorList>(ErrorList.class));
	}
	
	public ErrorList findById(Integer id){
			
			String sql = """
							select e.id
							, e.category_id 
							,e.error_list
							,e.cause
							,e.solution
							, c.id category_id
							, c.name category_name 
							from error_list e
							join categories c 
							on e.category_id = c.id 
							where e.id = :id
							order by e.id;
					""";
			MapSqlParameterSource param = new MapSqlParameterSource();
			param.addValue("id", id);
			
			List<ErrorList> list = jdbcTemplate.query(sql, param, new BeanPropertyRowMapper<ErrorList>(ErrorList.class));

	        return list.isEmpty() ? null : list.get(0);
		}
	
	public int insert (ErrorList errorList) {
		String sql = """
						insert into error_list(category_id, error_list, cause, solution, error_date)
						values(:category_id, :error_list, :cause, :solution, current_timestamp)
				""";
		MapSqlParameterSource param = new MapSqlParameterSource();
		

		param.addValue("category_id", errorList.getCategory().getId());
        param.addValue("error_list", errorList.getErrorList());
        param.addValue("cause", errorList.getCause());
        param.addValue("solution", errorList.getSolution());
        
        return jdbcTemplate.update(sql, param);

	}
	
	
	public int delete(int id) {
		String sql = "DELETE FROM error_list WHERE id = :id;";
		
		MapSqlParameterSource param = new MapSqlParameterSource();
		param.addValue("id", id);
		
		return jdbcTemplate.update(sql, param);

	}
	
	
}
