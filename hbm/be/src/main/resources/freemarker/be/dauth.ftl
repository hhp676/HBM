<#-- 数据权限解析模板  @author shichengqun -->
<#list groupList as group>
	<#-- 过滤器组之间的关系为OR,第一个之后需要加OR -->
	<#if (group_index > 0)>
		OR 
	</#if>
	( 
		<#-- 此过滤器组一定不满足数据权限（不需sql解析直接返回 1!=1） -->
		<#if group.falseFlag?? && group.falseFlag>
			1 != 1
		<#else>
			<#list group.filterItemBeanList as item>
				<#-- 过滤器项之间的关系为AND，第一个之后需要加AND -->
				<#if (item_index > 0)>
					AND 
				</#if>
				<#-- 此过滤器项是自定义sql -->
				<#if item.dauthSql?? && item.dauthSql != "">
					(${item.dauthSql})
				<#else>
					${item.dauthSqlField} ${item.operatorValue} (${item.dauthSqlValue})
				</#if>
			</#list>
		</#if>
 	 )
</#list>