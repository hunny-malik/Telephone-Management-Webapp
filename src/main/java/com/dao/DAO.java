package com.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.entity.values;

public class DAO {

	private Connection conn;

	public DAO(Connection conn) {
		super();
		this.conn = conn;
	}

	public boolean insert(values val) {
		boolean f = false;

		try {
			String sql = "insert into info(name,address,email,dob,phone) values(?,?,?,?,?)";
			PreparedStatement ps = conn.prepareStatement(sql);

			ps.setString(1, val.getName());
			ps.setString(2, val.getAddress());
			ps.setString(3, val.getEmail());
			ps.setString(4, val.getDob());
			ps.setString(5, val.getPhone());

			int i = ps.executeUpdate();

			if (i == 1) {
				f = true;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}

		return f;
	}

	public List<values> showAllTelephone() {
		List<values> list = new ArrayList<values>();
		values val = null;

		try {
			String sql = "select * from info";
			PreparedStatement ps = conn.prepareStatement(sql);

			ResultSet rs = ps.executeQuery();

			while (rs.next()) {
				val = new values();
				val.setId(rs.getInt(1));
				val.setName(rs.getString(2));
				val.setAddress(rs.getString(3));
				val.setEmail(rs.getString(4));
				val.setDob(rs.getString(5));
				val.setPhone(rs.getString(6));

				list.add(val);

			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return list;
	}

	public values getTelephoneById(int id) {
		values val = null;

		try {
			String sql = "select * from info where id=?";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setInt(1, id);

			ResultSet rs = ps.executeQuery();

			while (rs.next()) {
				val = new values();
				val.setId(rs.getInt(1));
				val.setName(rs.getString(2));
				val.setAddress(rs.getString(3));
				val.setEmail(rs.getString(4));
				val.setDob(rs.getString(5));
				val.setPhone(rs.getString(6));

			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return val;
	}

	public boolean update(values val) {
		boolean f = false;

		try {
			String sql = "update info set name=?,address=?,email=?,dob=?,phone=? where id=?";
			PreparedStatement ps = conn.prepareStatement(sql);

			ps.setString(1, val.getName());
			ps.setString(2, val.getAddress());
			ps.setString(3, val.getEmail());
			ps.setString(4, val.getDob());
			ps.setString(5, val.getPhone());
			ps.setInt(6, val.getId());

			int i = ps.executeUpdate();

			if (i == 1) 
			{
				f = true;
			}
		} 
		catch (Exception e) 
		{
			e.printStackTrace();
		}

		return f;
	}
	
	public boolean delete(int id)
	{
		boolean f=false;
		try {
			
			String sql="delete from info where id=?";
			PreparedStatement ps=conn.prepareStatement(sql);
			ps.setInt(1, id);
			
			int i=ps.executeUpdate();
			if (i==1)
			{
				f=true;
			}
			
			
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		
		return f;
	}
}
