<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<html>
<jsp:include page="header.jsp"/>

<body ng-app="orderProductExchangeApp">
	<div class="layui-layout layui-layout-orderProductExchange" ng-controller="orderProductExchangeController">
 			<span class="layui-breadcrumb">
              <a><cite>首页</cite></a>
              <a><cite>客服</cite></a>
              <a><cite>换货查询</cite></a>
 			</span>
			<a class="layui-btn layui-btn-small" style="line-height:1.6em;margin-top:3px;float:right"
			   href="javascript:location.replace(location.href);" title="刷新"><i class="layui-icon" style="line-height:30px">ဂ</i></a>

		<div class="x-body">
			<form class="layui-form x-center" action="#" style="width:80%">
				<div class="layui-form-pane" style="margin-top: 15px;">
					<div class="layui-form-item">
						<label class="layui-form-label">日期范围</label>
						<div class="layui-input-inline">
							<input class="layui-input" placeholder="开始日" id="LAY_demorange_s">
						</div>
						<div class="layui-input-inline">
							<input class="layui-input" placeholder="截止日" id="LAY_demorange_e">
						</div>
						<div class="layui-input-inline">
							<input type="text" name="lmsOrderId" placeholder="请输入订单ID" autocomplete="off" class="layui-input"
								   ng-model="lmsOrderId">
						</div>
						<div class="layui-input-inline" style="width:80px">
							<button class="layui-btn" lay-submit="" lay-filter="sreach"><i class="layui-icon"
							>&#xe615;</i>
							</button>
						</div>
					</div>
				</div>
			</form>
			<table class="layui-table">
				<thead>
				<tr>
					<th>换货原因</th>
					<th> 换货日期</th>
					<th>数量</th>
					<th>订单ID</th>
					<th> 商品ID</th>
					<th>操作</th>
				</tr>
				</thead>
				<tbody>
			<tr ng-repeat="orderProductExchange in orderProductExchanges| filter:{'lmsOrderId':lmsOrderId}">
				<td>{{ orderProductExchange.reason }}</td>
				<td>{{ orderProductExchange.datetime }}</td>
				<td>{{ orderProductExchange.count }}</td>
				<td>{{ orderProductExchange.lmsOrderId }}</td>
				<td>{{ orderProductExchange.lmsProductId }}</td>
				<td>
					<a title="删除" href="javascript:;" ng-click="orderProductExchange_del(this,'1')"
					   style="text-decoration:none">
						<i class="layui-icon">&#xe640;</i>
					</a>
				</td>
			</tr>
			</tbody>
			</table>
		</div>
</div>


	<script src="${ basePath }/js/angular.min.js"></script>
	<script type="text/javascript">
        var app = angular.module('orderProductExchangeApp', []);
        app.controller('orderProductExchangeController', function ($scope) {
            $scope.orderProductExchanges = ${ orderProductExchanges };

            //编辑
            $scope.admin_edit = function(title,id,w,h) {
                x_admin_show(title,'/updateAdmin/'+id,w,h);
            }

            $scope.admin_add = function(title,url,w,h){
                x_admin_show(title,url,w,h);
            }

            $scope.admin_del=function (id) {
                var adminid = id;
                layer.confirm('确认要删除吗？',function(){
                    window.location ="deleteAdmin/"+adminid;
                });
            }
        });
	</script>

	<script src="${basePath}/lib/layui/layui.js" charset="utf-8"></script>
	<script src="${basePath}/js/x-layui.js" charset="utf-8"></script>
	<script>
        layui.use(['laydate','element','laypage','layer'], function(){
            $ = layui.jquery;//jquery
            laydate = layui.laydate;//日期插件
            lement = layui.element();//面包导航
            laypage = layui.laypage;//分页
            layer = layui.layer;//弹出层

            //以上模块根据需要引入

            laypage({
                cont: 'page'
                ,pages: 100
                ,first: 1
                ,last: 100
                ,prev: '<em><</em>'
                ,next: '<em>></em>'
            });

            var start = {
                min: laydate.now()
                ,max: '2099-06-16 23:59:59'
                ,istoday: false
                ,choose: function(datas){
                    end.min = datas; //开始日选好后，重置结束日的最小日期
                    end.start = datas //将结束日的初始值设定为开始日
                }
            };

            var end = {
                min: laydate.now()
                ,max: '2099-06-16 23:59:59'
                ,istoday: false
                ,choose: function(datas){
                    start.max = datas; //结束日选好后，重置开始日的最大日期
                }
            };

            document.getElementById('LAY_demorange_s').onclick = function(){
                start.elem = this;
                laydate(start);
            }
            document.getElementById('LAY_demorange_e').onclick = function(){
                end.elem = this
                laydate(end);
            }

        });
	</script>
</body>
</html>