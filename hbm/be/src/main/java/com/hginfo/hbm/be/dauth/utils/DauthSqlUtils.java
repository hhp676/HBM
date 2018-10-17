package com.hginfo.hbm.be.dauth.utils;

import java.util.List;

import org.apache.ibatis.scripting.xmltags.ChooseSqlNode;
import org.apache.ibatis.scripting.xmltags.ForEachSqlNode;
import org.apache.ibatis.scripting.xmltags.IfSqlNode;
import org.apache.ibatis.scripting.xmltags.MixedSqlNode;
import org.apache.ibatis.scripting.xmltags.SqlNode;
import org.apache.ibatis.scripting.xmltags.StaticTextSqlNode;
import org.apache.ibatis.scripting.xmltags.TextSqlNode;
import org.apache.ibatis.scripting.xmltags.TrimSqlNode;

import com.hginfo.hutils.ReflectUtil;

/**
 * 处理数据权限相关的工具类。 <br/>
 * Date: 2016年11月26日 下午12:39:47 <br/>
 * @author shichengqun
 */
public class DauthSqlUtils {
    
    /**
     * Creates a new instance of SqlNodeUtils.
     */
    private DauthSqlUtils() {
    }
    
    /**
     * 获取mybatis sql语句所有textNode。
     * @param sqlNode 需处理的节点
     * @param textNodeList 需返回的sql语句Node，TextSqlNode + StaticTextSqlNode
     */
    @SuppressWarnings("unchecked")
    public static void getAllTextNode(SqlNode sqlNode, List<SqlNode> textNodeList) {
        /* Node类型：
         * MixedSqlNode 属性：contents(List<SqlNode>)
         * TrimSqlNode--子-->SetSqlNode  WhereSqlNode  属性：contents(SqlNode)
         * IfSqlNode 属性：contents(SqlNode)
         * ForEachSqlNode 属性：contents(SqlNode)
         * ChooseSqlNode 属性：defaultSqlNode(SqlNode)  ifSqlNodes(List<SqlNode>)
         * TextSqlNode  $的sql
         * StaticTextSqlNode #的sql
         * VarDeclSqlNode  不处理
         */
        if (sqlNode == null || textNodeList == null) {
            return;
        }
        
        if (sqlNode instanceof MixedSqlNode) {
            List<SqlNode> sqlNodes = (List<SqlNode>) ReflectUtil.getFieldValue(sqlNode, "contents");
            for (SqlNode node : sqlNodes) {
                getAllTextNode(node, textNodeList);
            }
        } else if (sqlNode instanceof TrimSqlNode || sqlNode instanceof IfSqlNode
            || sqlNode instanceof ForEachSqlNode) {
            SqlNode node = (SqlNode) ReflectUtil.getFieldValue(sqlNode, "contents");
            getAllTextNode(node, textNodeList);
        } else if (sqlNode instanceof ChooseSqlNode) {
            List<SqlNode> sqlNodes = (List<SqlNode>) ReflectUtil.getFieldValue(sqlNode, "ifSqlNodes");
            for (SqlNode node : sqlNodes) {
                getAllTextNode(node, textNodeList);
            }
            SqlNode defaultNode = (SqlNode) ReflectUtil.getFieldValue(sqlNode, "defaultSqlNode");
            getAllTextNode(defaultNode, textNodeList);
        } else if (sqlNode instanceof TextSqlNode || sqlNode instanceof StaticTextSqlNode) {
            textNodeList.add(sqlNode);
        }
    }
    
}

