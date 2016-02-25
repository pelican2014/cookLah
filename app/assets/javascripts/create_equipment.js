$(function(){

  // close collapsible and trigger search to update ingredients search results
  $('#create_equipment_form').on('ajax:success', closeCollapsible);

  function closeCollapsible(){

    $('#collapse_equipment').collapse('hide');

    $('#equipment_search').submit();
    
  }

});