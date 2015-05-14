$(function(){
	$('.update-form input[type="checkbox"]').click(function(){
		$(this).parent('form').submit();
	});
});
