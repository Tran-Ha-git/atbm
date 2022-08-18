package exam.edu.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import exam.edu.model.Key;

public class KeyDao {
	private Connection con;
	private ResultSet rs;
	private PreparedStatement pst;
	private String query;

	public KeyDao(Connection con) {
		this.con = con;
	}

	public List<Key> getKeysByUserId(Long userId) {
		List<Key> keys = new ArrayList<Key>();
		try {
			query = "select * from `key` where user_id = ?";
			pst = this.con.prepareStatement(query);
			pst.setLong(1, userId);
			rs = pst.executeQuery();

			while (rs.next()) {
				Key key = new Key();
				key.setId(rs.getLong("id"));
				key.setPublicKey(rs.getString("public_key"));
				key.setStatus(rs.getInt("status"));

				keys.add(key);
			}
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println(e.getMessage());
		}
		return keys;
	}

	public boolean updateStatus(Long id, Integer status) {
		try {
			query = "UPDATE `key` SET status =? WHERE id =?";
			pst = this.con.prepareStatement(query);
			pst.setLong(1, status);
			pst.setLong(2, id);
			int rowsUpdated = pst.executeUpdate();
			if (rowsUpdated > 0) {
				System.out.println("An status key was updated successfully!");
				if (status == 1) {
					query = "UPDATE `key` SET status = 0 WHERE id !=?";
					pst = this.con.prepareStatement(query);
					pst.setLong(1, id);
					pst.executeUpdate();
				}

				return true;
			}

		} catch (Exception e) {
			e.printStackTrace();
			System.out.println(e.getMessage());
		}
		return false;
	}

	public boolean deleteById(Long id) {
		try {
			query = "DELETE FROM `key` WHERE id=?";
			pst = this.con.prepareStatement(query);
			pst.setLong(1, id);
			int rowsUpdated = pst.executeUpdate();
			if (rowsUpdated > 0) {
				System.out.println("A key was deleted successfully!");
				return true;
			}

		} catch (Exception e) {
			e.printStackTrace();
			System.out.println(e.getMessage());
		}
		return false;
	}

	public boolean insertKey(Key key) {
		try {
			query = "INSERT INTO `key` (public_key, status, user_id) VALUES (?, ?, ?)";

			pst = this.con.prepareStatement(query, Statement.RETURN_GENERATED_KEYS);
			pst.setString(1, key.getPublicKey());
			pst.setInt(2, key.getStatus());
			pst.setLong(3, key.getUserId());

			int rowsUpdated = pst.executeUpdate();
			if (rowsUpdated > 0) {
				System.out.println("A key was inserted successfully!");
				try (ResultSet generatedKeys = pst.getGeneratedKeys()) {
					Long id = null;
					if (generatedKeys.next()) {
						id = generatedKeys.getLong(1);
						if (id != null) {
							query = "UPDATE `key` SET status = 0 WHERE id !=?";
							pst = this.con.prepareStatement(query);
							pst.setLong(1, id);
							pst.executeUpdate();
						}
					} else {
						throw new SQLException("Creating key failed, no ID obtained.");
					}
				}

				return true;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return false;
	}
}
