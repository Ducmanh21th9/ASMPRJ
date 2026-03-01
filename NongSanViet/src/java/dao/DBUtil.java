package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DBUtil {
    private static final String URL =
        "jdbc:sqlserver://localhost:1433;databaseName=NongSanViet;encrypt=true;trustServerCertificate=true;";
    private static final String USER = "sa";
    private static final String PASS = "123456";

    static {
        try {
            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
        } catch (ClassNotFoundException e) {
            throw new RuntimeException("Thiếu JDBC Driver SQL Server (mssql-jdbc).", e);
        }
    }

    public static Connection getConnection() throws SQLException {
        return DriverManager.getConnection(URL, USER, PASS);
    }
}