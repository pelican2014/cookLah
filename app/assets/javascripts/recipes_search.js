$(function() {
  // ajax call for submitting search form
  ajax_search_submit('#recipes_search');

  // ajax call for keying into the search bar
  ajax_search_keyup('#recipes_search')
});