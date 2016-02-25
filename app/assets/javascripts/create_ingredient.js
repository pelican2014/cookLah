$(function(){

  // close collapsible and trigger search to update ingredients search results
  $('#create_ingredient_form').on('ajax:success', closeCollapsible);

  function closeCollapsible(){

    $('#collapsible_ingredient').collapse('hide');

    $('#ingredients_search').submit();

  }

});