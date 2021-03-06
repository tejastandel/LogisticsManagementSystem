<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="header.jsp"%>
<html>
<body>
        <div class="x-body">
            <form class="layui-form" items="${orderEdits}">
                <div class="layui-form-item">
                    <div class="layui-input-inline">
                        <input type="text" id="id" name="id" value="${orderEdits.id}" style="display: none">
                    </div>
                    <label for="totalPrice" class="layui-form-label">
                        总价
                    </label>
                    <div class="layui-input-inline">
                        <input type="text" id="totalPrice" name="totalPrice" required="" lay-verify="required"
                               autocomplete="off"   disabled="" class="layui-input" value="${order.totalPrice}">
                    </div>
                </div>

                <div class="layui-form-item">
                    <label for="orderNumber" class="layui-form-label">
                        订单号码
                    </label>
                    <div class="layui-input-inline">
                        <input type="text" id="orderNumber" name="orderNumber" required="" lay-verify="required"
                               autocomplete="off" class="layui-input" value="${order.orderNumber}">
                    </div>
                </div>

                <div class="layui-form-item">
                    <label for="description" class="layui-form-label">
                         订单描述
                    </label>
                    <div class="layui-input-inline">
                        <input type="text" id="description" name="description" required="" lay-verify="required"
                               autocomplete="off" class="layui-input" value="${order.description}">
                    </div>
                </div>

                <div class="layui-form-item">
                    <label class="layui-form-label">
                        订单类型
                    </label>
                    <div class="layui-input-inline">
                        <select name="right" title="right" id="right">
                            <option value="" >${order.type}</option>
                            <option value="0">缺货</option>
                            <option value="1">可分配</option>
                            <option value="2">退订</option>
                            <option value="3">换货</option>
                            <option value="4">退货</option>
                            <option value="5">已分配</option>
                        </select>
                    </div>

                <div class="layui-form-item">
                    <label for="address" class="layui-form-label">
                        地址
                    </label>
                    <div class="layui-input-inline">
                        <input type="text" id="address" name="address" required="" lay-verify="required"
                               autocomplete="off" class="layui-input" value="${order.address}">
                    </div>
                </div>

                <div class="layui-form-item">
                    <label for="lmsCustomerId" class="layui-form-label">
                        客户ID
                    </label>
                    <div class="layui-input-inline">
                        <input type="text" id="lmsCustomerId" name="lmsCustomerId" required="" lay-verify="required"
                               autocomplete="off" value="${order.lmsCustomerId}" disabled="" class="layui-input">
                    </div>
                </div>

                <div class="layui-form-item">
                    <label for="payer" class="layui-form-label">
                        支付人姓名
                    </label>
                    <div class="layui-input-inline">
                        <input type="text" id="payer" name="payer" required="" lay-verify="required"
                               autocomplete="off" class="layui-input" value="${order.payer}">
                    </div>
                </div>

                <div class="layui-form-item">
                    <label for="payerAddress" class="layui-form-label">
                        地址
                    </label>
                    <div class="layui-input-inline">
                        <input type="text" id="payerAddress" name="payerAddress" required="" lay-verify="required"
                               autocomplete="off" class="layui-input" value="${order.payerAddress}">
                    </div>
                </div>

                <div class="layui-form-item">
                    <label for="payerPhone" class="layui-form-label">
                        联系电话
                    </label>
                    <div class="layui-input-inline">
                        <input type="text" id="payerPhone" name="payerPhone" required="" lay-verify="required"
                               autocomplete="off" class="layui-input" value="${order.payerPhone}">
                    </div>
                </div>

                <div class="layui-form-item">
                    <label for="payerPostCode" class="layui-form-label">
                        邮编
                    </label>
                    <div class="layui-input-inline">
                        <input type="text" id="payerPostCode" name="payerPostCode" required="" lay-verify="required"
                               autocomplete="off" class="layui-input" value="${order.payerPostCode}">
                    </div>
                </div>

                <div class="layui-form-item">
                    <label for="datetime" class="layui-form-label">
                        时间
                    </label>
                    <div class="layui-input-inline">
                        <input type="text" id="datetime" name="datetime" required="" lay-verify="required"
                               autocomplete="off"  value="${order.datetime}" disabled="" class="layui-input">
                    </div>
                </div>

                <div class="layui-form-item">
                    <label for="lmsorderEditId" class="layui-form-label">
                        管理员ID
                    </label>
                    <div class="layui-input-inline">
                        <input type="text" id="lmsorderEditId" name="lmsorderEditId" required="" lay-verify="required"
                               autocomplete="off"  value="${order.lmsorderEditId}" disabled="" class="layui-input">
                    </div>
                </div>
                <div class="layui-form-item">
                    <label  class="layui-form-label">
                    </label>
                    <button class="layui-btn" onclick="update()">修改</button>
                </div>
            </form>
        </div>



        <script src="${basePath}/lib/layui/layui.js" charset="utf-8">
        </script>
        <script src="${basePath}/js/x-layui.js" charset="utf-8">
        </script>
        <script>

            function update() {
                $.ajax({
                    type: "POST",
                    url: "/Dispatching/updateorderEditSub",
                    data: {
                        id: $('#id').val(),
                        totalPrice: $('#totalPrice').val(),
                        orderNumber: $('#orderNumber').val(),
                        description: $('#description').val(),
                        type: $('#type').val(),
                        address: $('#address').val(),
                        lmsCustomerId: $('#lmsCustomerId').val(),
                        payer: $('#payer').val(),
                        payerAddress: $('#payerAddress').val(),
                        payerPhone: $('#payerPhone').val(),
                        payerPostCode: $('#payerPostCode').val(),
                        datetime: $('#datetime').val(),
                        lmsAdminId: $('#lmsAdminId').val(),
                    },
                    error: function (request) {
                        alert("Connection error");
                    },
                    success: function (data) {
                        window.parent.location.reload();
                    }
                });
            }

            layui.use(['form','layer'], function(){
                $ = layui.jquery;
              var form = layui.form()
              ,layer = layui.layer;
            });
        </script>



    </body>

</html>