package com.javatpoint.dao;

import java.util.List;

import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;

import com.javatpoint.beans.Item;

import java.sql.ResultSet;
import java.sql.SQLException;

public class ItemDao {

	JdbcTemplate template;

	public void setTemplate(JdbcTemplate template) {
		this.template = template;
	}

	public int save(Item item) {
		String sql = "INSERT INTO item (itemnumber, itemname, price) VALUES (" + item.getItemnumber() + "," + "" + "'"
				+ item.getItemname() + "', " + item.getPrice() + ")";
		return template.update(sql);
	}

	public int update(Item item) {
		String sql = "update item set itemname=" + item.getItemname() + ", price='" + item.getPrice()
				+ "' where itemNumber=" + item.getItemnumber();
		return template.update(sql);
	}

	public Item getItemByItemnumber(int itemnumber) {
		String sql = "select * from item where itemnumber=?";
		return template.queryForObject(sql, new Object[] { itemnumber }, new BeanPropertyRowMapper<Item>(Item.class));
	}

	public List<Item> getItems() {
		return template.query("select * from item", new RowMapper<Item>() {
			public Item mapRow(ResultSet rs, int row) throws SQLException {
				Item item = new Item();
				item.setItemnumber(rs.getInt(1));
				item.setItemname(rs.getString(2));
				item.setPrice(rs.getFloat(3));

				return item;
			}
		});
	}

	public void delete(List<Integer> itemNumbers) {
		// Convert the list of item numbers to a comma-separated string for SQL
		String inSql = String.join(",", itemNumbers.stream().map(String::valueOf).toArray(String[]::new));
		String sql = "DELETE FROM items.item WHERE itemnumber IN (" + inSql + ")";
		template.update(sql);
	}

}
