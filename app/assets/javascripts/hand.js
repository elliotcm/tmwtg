(function() {
  "use strict";
  window.TMWTG = window.TMWTG || {};
  var $ = window.jQuery;

  TMWTG.hand = {
    init: function() {
      var $hand = $('.hand');

      if ($hand.data('lobby')) {
        setTimeout(function() {
          window.location.reload();
        }, 2000);

        return;
      }

      TMWTG.sendTo.init($hand);
    }
  };
}());
