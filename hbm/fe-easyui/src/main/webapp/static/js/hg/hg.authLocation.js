/**
 * 权限treegrid定位方法
 * @author yinyanzhen
 */
function sysAuthLocation(treegrid,strCondition,nextbutton) {
	this.grid = treegrid;
	this.strCondition = strCondition;
	this.nextbutton = nextbutton;
	this.rootIndex ;
	this.showIndex ;
	
}
/**
 * 查询匹配字段值
 * 1.实现原理:获取所有子节点,匹配,
 * @author yinyanzhen
 */
sysAuthLocation.prototype.searchStr = function(){
	this.rootIndex = new Array();
	this.nextbutton.hide();
    var strCondition = this.strCondition;
    if(strCondition==''){
        HgUi.error("请先输入搜索值!");
        this.grid.treegrid('reload');
        return false;
    }
    //获取所有行数据
    var roots = this.grid.treegrid('getChildren');
    for( var key in roots){
        var authName = String(roots[key].authName);
        var authShowType = String(roots[key].authShowType);
        //搜索值匹配
        if(authShowType=='2' && authName.indexOf(strCondition)>=0){
            this.rootIndex[this.rootIndex.length]=roots[key].authId;
        }
    }
    if(this.rootIndex.length<1){
        HgUi.error("不存在匹配值!");
        return false;
    }
    this.nextbutton.show();
    this.showIndex=-1;
    this.showNext();
}
/**
 * 定位下一个匹配值
 */
sysAuthLocation.prototype.showNext = function (){
    if(this.showIndex == this.rootIndex.length-1){
        HgUi.notice("当前已经是最后一个匹配值!");
        return false;
    }
    this.grid.treegrid('collapseAll');
    this.showIndex++; 
    if(this.rootIndex.length>0){
    	this.grid.treegrid('expandTo',this.rootIndex[this.showIndex]);
        this.grid.treegrid('select',this.rootIndex[this.showIndex]);
    }
}