function addItem(productId){
	$.get(
			'cart_addItem',
			{'productId':productId},
			function(data){
				//0：购买失败；1：购买成功；99：已经购买；100：未登录
				if(data == 0){
					alert('购买失败');
				}
				else if(data == 1){
					alert('已添加到购物车');
				}
				else if(data == 99){
					alert('已经购买过此商品，请到购物车中更改数量');
				}
				else if(data == 100){
					alert('请登录再购买');
				}
			}
	);
}

function modify(productId){
	var newqty = $('#newqty_'+productId).val();
	var reg = /^\d+$/;
	if(!reg.test(newqty) || newqty < 1){
		alert('请输入合法的数字');
	}else{
		$.get(
			'cart_changeQty',
			{'productId':productId,'newQty':newqty},
			function(data){
				data = (parseFloat(data)).toFixed(2);
				$('#qty_'+productId).html(newqty);
				$('#total_account').html(data);
				$('#newqty_'+productId).val('');
			},
			'json'
		);
	}
}

function removeItem(productId){
	var flag = confirm('确定要将此商品移出购物车？');
	if(flag){
		$.get(
				'cart_removeItem',
				{'productId':productId},
				function(data){
					if(data > 0){
						$('#cart_'+productId).remove();
						$('#total_account').html(data);
					}else{
						alert('系统繁忙，请稍候重试');
					}
				},
				'json'
			);
	}	
}