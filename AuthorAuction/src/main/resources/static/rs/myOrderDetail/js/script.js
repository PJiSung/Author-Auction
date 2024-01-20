// myOrderDetail-b [VulQFYt6XK]
(function() {
  $(function() {
    $(".hooms-order-N1").each(function() {
      const $block = $(this);
      // order Textarea Count
      $block.find("textarea").on("keyup", function() {
        var orderText = $(this).val();
        if (orderText.length == 0 || orderText == "") {
          $block.find(".order-text-count").text("0자");
        } else {
          $block.find(".order-text-count").text(orderText.length);
        }
        if (orderText.length > 4000) {
          $(this).val($(this).val().substring(0, 4000));
        }
      });
      // order File Cancel Button
      $block.find('.order-form-file').each(function() {
        const $this = $(this);
        $this.find('.fileset-input').on('change', function() {
          $(this).siblings('.fileset-btn-cancel').show();
        });
        $this.find('.fileset-btn-cancel').on('click', function() {
          $(this).siblings('.fileset-input').val('');
          $(this).hide();
        });
      });
    });
  });
})();;