package com.hginfo.hbm.agent.org.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.sql.DataSource;

import com.hginfo.hutils.exception.BaseRuntimeException;

/**
 * 基础service
 * Date: 2017年6月26日 下午5:58:45 <br/>
 * @author shichengqun
 */
public class BaseService {
    
    public static final String ORACLE = "oracle";
    public static final String MYSQL = "mysql";
    
    private DataSource dataSource;
    
    private Connection getConn() {
        try {
            return dataSource.getConnection();
        } catch (SQLException e) {
            e.printStackTrace();
            throw new BaseRuntimeException(e.getMessage());
        }
    }

    /**
     * update
     *
     * @param sql
     * @param params
     */
    public int update(String sql, Object params[]) {
        Connection connection = getConn();
        PreparedStatement preparedStatement = null;
        int ret = 0;
        try {
            preparedStatement = connection.prepareStatement(sql);
            if (params != null) {
                for (int i = 0; i < params.length; i++) {
                    preparedStatement.setObject(i + 1, params[i]);
                }
            }
            ret = preparedStatement.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
            throw new BaseRuntimeException(e.getMessage());
        } finally {
            release(connection, preparedStatement, null);
        }
        return ret;
    }

    /**
     * query
     *
     * @param sql
     * @param params
     * @return
     */
    public List<Map<String, Object>> query(String sql, Object[] params) {
        Connection connection = getConn();
        PreparedStatement preparedStatement = null;
        ResultSet resultSet = null;
        try {
            preparedStatement = connection.prepareStatement(sql);
            if (params != null) {
                for (int i = 0; i < params.length; i++) {
                    preparedStatement.setObject(i + 1, params[i]);
                }
            }
            resultSet = preparedStatement.executeQuery();

            List<Map<String, Object>> ret = resultSetToList(resultSet);
            return ret;
        } catch (Exception e) {
            e.printStackTrace();
            throw new BaseRuntimeException(e.getMessage());
        } finally {
            release(connection, preparedStatement, resultSet);
        }
    }

    private List<Map<String, Object>> resultSetToList(ResultSet resultSet) throws SQLException {
        if (resultSet == null) {
            return new ArrayList<Map<String, Object>>();
        }

        ResultSetMetaData resultSetMetaData = resultSet.getMetaData(); // 得到结果集(rs)的结构信息，比如字段数、字段名等
        int columnCount = resultSetMetaData.getColumnCount(); // 返回此 ResultSet 对象中的列数

        List<Map<String, Object>> list = new ArrayList<Map<String, Object>>();
        while (resultSet.next()) {
            Map<String, Object> rowData = new HashMap<String, Object>(columnCount);
            for (int i = 1; i <= columnCount; i++) {
                rowData.put(resultSetMetaData.getColumnLabel(i), resultSet.getObject(i));
            }
            list.add(rowData);
        }
        return list;
    }
    
    /**
     * 获取数据库类型。
     * @return oracle、mysql
     */
    public String dbType() {
        String rawUrl = "";
        Connection connection = getConn();
        try {
            rawUrl = connection.getMetaData().getURL();
        } catch (Exception e) {
            e.printStackTrace();
            throw new BaseRuntimeException(e.getMessage());
        } finally {
            release(connection, null, null);
        }
        if (rawUrl.startsWith("jdbc:oracle:") || rawUrl.startsWith("jdbc:log4jdbc:oracle:")) {
            return ORACLE;
        } else if (rawUrl.startsWith("jdbc:mysql:") || rawUrl.startsWith("jdbc:cobar:")
            || rawUrl.startsWith("jdbc:log4jdbc:mysql:")) {
            return MYSQL;
        } 
        throw new BaseRuntimeException("数据库类型不支持，暂时只支持mysql、oracle。");
    }

    /**
     * release
     * @param connection
     * @param preparedStatement
     * @param resultSet
     */
    public void release(Connection connection, PreparedStatement preparedStatement, ResultSet resultSet) {
        if (resultSet != null) {
            try {
                resultSet.close();
            } catch (SQLException e) {
                e.printStackTrace();
                throw new BaseRuntimeException(e.getMessage());
            }
        }
        if (preparedStatement != null) {
            try {
                preparedStatement.close();
            } catch (SQLException e) {
                e.printStackTrace();
                throw new BaseRuntimeException(e.getMessage());
            }
        }
        if (connection != null) {
            try {
                connection.close();
            } catch (SQLException e) {
                e.printStackTrace();
                throw new BaseRuntimeException(e.getMessage());
            }
        }
    }

    public DataSource getDataSource() {
        return dataSource;
    }

    public void setDataSource(DataSource dataSource) {
        this.dataSource = dataSource;
    }
}

