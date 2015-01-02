(function() {
  "use strict";
  window.TMWTG = window.TMWTG || {};
  var $ = window.jQuery;

  TMWTG.lobby = {
    init: function() {
      $('.lobby-overlay').toggle($('.scoreboard').hasClass('lobby'));
    }
  };
}());
