// ajax call for submitting search form
function ajax_search_submit(id){
  $(id).submit(function(){
    $.get(this.action, $(this).serialize(), null, 'script');
    return false;
  });
}

// ajax call for keying into the search bar
function ajax_search_keyup(id){
  $(id + ' input').keyup(function() {
    $.get($(id).attr('action'), $(id).serialize(), null, 'script');
    return false;
  });
}