(function() {
  "use strict";
  window.TMWTG = window.TMWTG || {};
  var $ = window.jQuery;

  var persistLetters = function(words) {
    var letters = [];

    $.each(words, function(index, word) {
      $.each(word, function(index, $letter) {
        letters.push({
          id: $letter.data('id'),
          row_index: $letter.data('row-index'),
          column_index: $letter.data('column-index')
        });
      });
    });

    var data = {
      letters: letters
    }

    $.post($('.board').data('save-letters-path'), data, function() {
      $('.new-word-list').empty();
    }, 'json');
  };

  var registerWordsWithScores = function() {

  };

  TMWTG.wordSubmission = {
    init: function() {
      $('.submit-words').on('click', function(event) {
        var newWords = TMWTG.wordFinder.newWords();

        persistLetters(newWords);
        registerWordsWithScores(newWords);

        event.stopPropagation();
      });
    }
  };
}());
