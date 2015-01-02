(function() {
  "use strict";
  window.TMWTG = window.TMWTG || {};
  var $ = window.jQuery;

  TMWTG.letterPlacement = {
    init: function() {
      var $playerInfo = $('.player-info');
      var $letters = $playerInfo.find('.letter');

      TMWTG.sendTo.init($playerInfo);

      $letters.on('click', function(event) {
        $letters.removeClass('selected');
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

        selectedLetter.data('row-index', targetSquare.data('row-index'));
        selectedLetter.data('column-index', targetSquare.data('column-index'));

        TMWTG.letterPlacement.selectedLetter = undefined;

        var $newWordList = $('.new-word-list');
        $newWordList.empty();
        $.each(TMWTG.wordFinder.newWords(), function(index, word) {
          var $word = $('<li class="word" />');
          $.each(word, function(index, $letter) {
            $word.text($word.text() + $letter.find('.character').text());
          });

          $newWordList.append($word);
        });
      });
    }
  };
}());
