$(function(){

  // close collapsible and trigger search to update ingredients search results
  $('#create_recipe_form').on('ajax:success', closeCollapsible);

  function closeCollapsible(){

    $('#collapse_recipe').collapse('hide');

    $('#recipes_search').submit();

  }

});