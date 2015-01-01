(function() {
  "use strict";
  window.TMWTG = window.TMWTG || {};
  var $ = window.jQuery;

  TMWTG.letterPlacement = {
    init: function() {
      var letters = $('.letter');

      letters.on('click', function(event) {
        letters.removeClass('selected');
        $(this).addClass('selected');
        TMWTG.letterPlacement.selectedLetter = $(this);

        event.stopPropagation();
      });

      $('.square').on('click', function() {
        var targetSquare = $(this);
        var selectedLetter = TMWTG.letterPlacement.selectedLetter;

        if (selectedLetter === undefined) {
          return;
        }

        selectedLetter.closest('td').filter('.in-use').removeClass('in-use');
        targetSquare
          .addClass('in-use')
          .append(selectedLetter);

        TMWTG.letterPlacement.selectedLetter = undefined;
      });
    }
  };
}());
