$(function(){

  $('#create_new_ingredients_dialog').dialog({
    autoOpen: false,
    title: "Add New Ingredients",
    autoResize: true,
    modal: true,
  });

  $('#create_new_ingredients_button').click(showDialog);

  function showDialog(){
    $('#create_new_ingredients_dialog').dialog('open');
    return false;
  }


});