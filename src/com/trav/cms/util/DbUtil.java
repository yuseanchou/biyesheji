package com.trav.cms.util;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class DbUtil {
/**
 * @author forguo
 * @date 2021-4-1
 * 数据库连接工具类
 */
	
	//静态代码块
	static {
		try {
			/*1加载驱动*/
			Class.forName(DbConfig.DRIVER_CLASS);
//			System.out.println("正确");
			//oracle.jdbc.driver.OracleDriver  Oracle
		}
		catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
//			System.out.println("错误");
			e.printStackTrace();
		}
	}
	/*
	 *  连接参数
	 *  */
	//Oracle  static String url = "jdbc:oracle:thin:@localhost:1521:orcl";
	static String url =  DbConfig.DB_URL + DbConfig.DB_IP + DbConfig.DB_PORT + DbConfig.DB_SID+DbConfig.CODE;
	static String user = DbConfig.USER;
	static String pwd =  DbConfig.PWD;

	public static Connection getConn() {
		Connection conn = null;
		try {
			/* 2.创建连接 */
			System.out.println("dwdadafaohldad;aj");
//			conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/trav_cms?user=root&password=1234&serverTimezone=UTC"
//);
			String url = "jdbc:mysql://localhost:3306/trav_cms?user=root&password=1234&serverTimezone=UTC";
			conn = DriverManager.getConnection(url);
			System.out.println("正确");
			System.out.println("*--------------------------------------------------*");
			System.out.println("Db-MySql-getConnection!");
			System.out.println("user:"+user+" , pwd："+pwd);
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			System.out.println("错误");
			e.printStackTrace();
		}
		if (conn == null) {
			return null;
		}
		return conn;
	}

	/*
	 *关闭连接
	 * */
	public static void closeConn(Connection conn, PreparedStatement ps,
			ResultSet rs) {
			try {
				System.out.println("Close connection!");
				System.out.println("*--------------------------------------------------*");
			if (conn != null) {
				conn.close();
			}
			if (ps != null) {
				ps.close();
			}
			if (rs != null) {
				rs.close();
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
}