$(function(){
	$('#user_story_user_ids').chosen()
});
$(function(){
	$('.update-form input[type="checkbox"]').click(function(){
		$(this).parent('form').submit();
	});
});