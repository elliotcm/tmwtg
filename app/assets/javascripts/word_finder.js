(function() {
  "use strict";
  window.TMWTG = window.TMWTG || {};
  var $ = window.jQuery;

  TMWTG.wordFinder = {
    words: function() {
      var rows = $('.board tr');
      var words = [];
      var columns = [];

      rows.each(function(rowIndex) {
        var row = $(this);
        var currentWord = [];

        row.children().each(function(columnIndex) {
          var square = $(this);
          var letter = square.children('.letter');

          if (columns[columnIndex] === undefined) {
            columns[columnIndex] = [];
          }

          columns[columnIndex][rowIndex] = square;

          if (letter.length > 0) {
            currentWord.push(letter)
          } else {
            if (currentWord.length > 1) {
              words.push(currentWord);
              currentWord = [];
            }
          }
        });

        if (currentWord.length > 1) {
          words.push(currentWord)
        }
      });

      $.each(columns, function(columnIndex, column) {
        var currentWord = [];

        $.each(column, function(rowIndex, square) {
          var letter = square.children('.letter');

          if (letter.length > 0) {
            currentWord.push(letter)
          } else {
            if (currentWord.length > 1) {
              words.push(currentWord);
              currentWord = [];
            }
          }
        });

        if (currentWord.length > 1) {
          words.push(currentWord)
        }
      });

      return words;
    },
    newWords: function() {
      var newWords = $.grep(TMWTG.wordFinder.words(), function(word) {
        var newCharacters = $.grep(word, function(letter) {
          return !letter.hasClass('fixed');
        });

        return newCharacters.length > 0;
      });

      return newWords;
    }
  };
}());
