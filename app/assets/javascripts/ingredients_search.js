$(function() {

  // ajax call for submitting search form
  $('#ingredients_search').submit(function(){
    $.get(this.action, $(this).serialize(), null, 'script');
    return false;
  });

  // ajax call for keying into the search bar
  $('#ingredients_search input').keyup(function() {
    $.get($('#ingredients_search').attr('action'), $('#ingredients_search').serialize(), null, 'script');
    return false;
  });
});