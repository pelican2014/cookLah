$(function() {
  // ajax call for submitting search form
  ajax_search_submit('#ingredients_search');

  // ajax call for keying into the search bar
  ajax_search_keyup('#ingredients_search')
});