$(function(){

  // make recipes search results table rows clickable
  $('#recipes_search_results tr').click(function(){
  	var href = $(this).find('a').attr('href');
  	if (href){
  		window.location = href;
  	}
  });

});