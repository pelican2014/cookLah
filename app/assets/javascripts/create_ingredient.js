$(function(){

  // close collapsible and trigger search to update ingredients search results
  $('#create_ingredient_form').on('ajax:success', closeCollapsible);

  function closeCollapsible(){

    $('#collapseExample').collapse('hide');

    $('#ingredients_search').submit();
  }

});