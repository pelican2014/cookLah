$(function(){

  // close collapsible and trigger search to update ingredients search results
  $('#create_equipment_form').on('ajax:success', closeCollapsible);

    $('#collapsible_equipment').collapse('hide');

    $('#equipment_search').submit();
    $('#equipment_search_for_recipe').submit();

    this.reset();

  });

});