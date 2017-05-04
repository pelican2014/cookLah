$(function(){

  // close collapsible, trigger search to update ingredients search results, clear form
  // $('#create_ingredient_form').on('ajax:success', function(){

  //   $('#collapsible_ingredient').collapse('hide');

  //   $('#ingredients_search').submit();
  //   $('#ingredients_search_for_recipe').submit();

  //   this.reset();

  // });

  var tryReload = function(){
  	window.location.reload(false);
  	setTimeOut(delayedReload, 500);
  }

  $('.reload').click(tryReload);
});