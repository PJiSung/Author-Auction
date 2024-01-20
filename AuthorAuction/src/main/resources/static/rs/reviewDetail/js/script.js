// reviewDetail [qWlQHt9Vh1]
(function() {
  $(function() {
    $(".reviewDetail").each(function() {
      const $block = $(this);
      const $thumbnail = $block.find('.contents-thumbnail .contents-thumbimg');
      const $thumbitem = $block.find('.contents-thumbitem .contents-thumbimg');
      // Thumbnail Click Event
      $thumbitem.on("click", changePic);

      function changePic() {
        const newPic = $(this).attr("src");
        $thumbnail.attr("src", newPic);
      }
      // Like Button Click Event
      $block.find('.btn-like-line').on('click', function() {
        $block.find('.contents-brand-group').addClass('like-on');
      });
      $block.find('.btn-like-fill').on('click', function() {
        $block.find('.contents-brand-group').removeClass('like-on');
      });
      // Amount Count Button Click Event
      $block.find(".contents-amount").each(function() {
        const $this = $(this);
        const $amountNumElement = $this.find(".contents-amount-num");
        $this.on("click", ".btn-minus", function() {
          let amountNum = parseInt($amountNumElement.text());
          if (amountNum > 1) {
            amountNum--;
          }
          $amountNumElement.text(amountNum);
        });
        $this.on("click", ".btn-plus", function() {
          let amountNum = parseInt($amountNumElement.text());
          amountNum++;
          $amountNumElement.text(amountNum);
        });
      });
    });
  });
})();