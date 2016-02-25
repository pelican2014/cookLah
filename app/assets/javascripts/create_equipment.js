$(function(){

  // configure dialog
  $('#create_new_equipment_dialog').dialog({
    autoOpen: false,
    title: 'Add New Equipment',
    autoResize: true,
    modal: true,
  });

  // show dialog on click of button
  $('#create_new_equipment_button').click(showDialog);

  // function for showing dialog
  function showDialog(){
    $('#create_new_equipment_dialog').dialog('open');
    return false;
  }

  $('#create_equipment_form').on('ajax:success', closeDialog);

  // ajax response after form is submitted
  function closeDialog(){
    // close dialog
    $('#create_new_equipment_dialog').dialog('close');
    // trigger search to update ingredients search results
    $('#equipment_search').submit();
  }

});