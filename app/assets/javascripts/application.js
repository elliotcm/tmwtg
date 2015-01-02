//= require_tree ./lib
//= require_tree .
//= require_self

$.ajaxSetup({
  headers: {
    'X-CSRF-Token': $('meta[name="csrf-token"]').attr('content')
  }
});

TMWTG.letterPlacement.init();
TMWTG.wordSubmission.init();
TMWTG.lobby.init();
TMWTG.hand.init();
