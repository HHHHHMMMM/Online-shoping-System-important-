/*
 * 发货
 */
function sendOrder(orderId){
	var isConfirm = window.confirm('确定发货？');
	if(isConfirm){
		$.get(
				'order_updateOrder',
				{'orderId':orderId,'status':1},
				function(data){
					if(data == -1){
						alert('订单已发货');
						$('#status_'+orderId).html('已发货<a href="javascript:deleteOrder(${orderId});">[删除]</a>');
					}else{
						alert('操作失败');
					}
				}
			);
	}else{
		return ;
	}
}
/*
 * 更新付款状态
 */
function payed(orderId){
	var isConfirm = window.confirm('确定更新付款状态？');
	if(isConfirm){
		$.get(
				'order_updateOrder',
				{'orderId':orderId,'status':0},
				function(data){
					if(data == -1){
						alert('付款状态已更改');
						$('#status_'+orderId).html('已收款 未发货<br/><a href="javascript:sendOrder('+orderId+');">[发货]</a><a href="javascript:deleteOrder(${orderId});">[删除]</a>');
					}else{
						alert('操作失败');
					}
				}
			);
	}else{
		return ;
	}
}
/*
 * 删除订单
 */
function deleteOrder(orderId){
	var isConfirm = window.confirm('确定删除此订单？');
	if(isConfirm){
		$.get(
				'order_deleteOrder',
				{'orderId':orderId},
				function(data){
					if(data == 1){
						alert('订单已删除');
						$('#row_'+orderId).remove();
					}else{
						alert('操作失败');
					}
				}
			);
	}else{
		return;
	}
}