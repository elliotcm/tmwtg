(function() {
  "use strict";
  window.TMWTG = window.TMWTG || {};
  var $ = window.jQuery;

  TMWTG.sendTo = {
    init: function($scope) {
      var $sendTo = $scope.find('.send-to');
      var $letters = $scope.find('.letter');

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

        $.post($scope.data('send-to-path'), data, function() {
          $selectedLetters.remove();
        }, 'json');
      });
    }
  };
}());
