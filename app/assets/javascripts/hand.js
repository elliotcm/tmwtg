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

      var $sendTo = $hand.find('.send-to');
      var $letters = $hand.find('.letter');

      $letters.on('click', function() {
        $(this).toggleClass('selected');
        $sendTo.attr('disabled', ($letters.filter('.selected').length === 0));
      });

      $sendTo.on('click', function() {
        var data = {
          target: $(this).data('target'),
          letter_ids: []
        };

        var $selectedLetters = $letters.filter('.selected');
        $selectedLetters.each(function() {
          data['letter_ids'].push($(this).data('id'));
        });

        $.post($hand.data('send-to-path'), data, function() {
          $selectedLetters.remove();
        }, 'json');
      });
    }
  };
}());
