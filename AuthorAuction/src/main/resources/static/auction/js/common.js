// hooms-N39 [uqLqcFv4LT]
(function() {
  $(function() {
    $(".hooms-N39").each(function() {
      const $block = $(this);
      // modalSet
      modalSet(".modalset-dim", "#modalSet1", "#modalSet2");

      function modalSet(dim, modalSet1, modalSet2) {
        // Modal Show
        $block.find('.modalset-btn').on('click', function() {
          $block.find(modalSet1).addClass('modalset-active');
          $block.find(dim).fadeIn();
        });
        // Modal Hide
        $block.find('.modalset-dim, .modal-close').on('click', function() {
          $block.find(modalSet1).removeClass('modalset-active');
          $block.find(modalSet2).removeClass('modalset-active');
          $block.find(dim).fadeOut();
        });
        $block.find(modalSet1).find('.btnset-confirm').on('click', function() {
          $block.find(modalSet1).removeClass('modalset-active');
          $block.find(modalSet2).addClass('modalset-active');
        });
        // Modal2 Show
        $block.find(modalSet2).find('.btnset-confirm').on('click', function() {
          $block.find(modalSet2).removeClass('modalset-active');
          $block.find(dim).fadeOut();
        });
      };
    });
  });
})();;