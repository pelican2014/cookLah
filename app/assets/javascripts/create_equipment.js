$(function(){

  // close collapsible and trigger search to update ingredients search results
  // $('#create_equipment_form').on('ajax:success', function(){

  //   $('#collapsible_equipment').collapse('hide');

  //   $('#equipment_search').submit();
  //   $('#equipment_search_for_recipe').submit();

  //   this.reset();

  // });

  var delayedReload = function(){
  	setTimeout(()=>{window.location.reload(false);}, 500);
  }

  $('.form-reload').submit(function(){
  	delayedReload();
  	return true;
  });
});