// basic-N1 [KSLQaH6Zk3]
(function() {
  $(function() {
    $(".basic-N1").each(function() {
      const $block = $(this);
      const $dim = $block.find('.header-dim');
      // Header Scroll
      $(window).on("load scroll", function() {
        const $thisTop = $(this).scrollTop();
        if ($thisTop > 120) {
          $block.addClass("header-top-active");
        } else {
          $block.removeClass("header-top-active");
        }
      });
      // Header Mobile 1Depth Click
      if (window.innerWidth <= 992) {
        $block.find(".header-gnbitem").each(function() {
          const $gnblink = $(this).find(".header-gnblink");
          const $sublist = $(this).find(".header-sublist");
          if ($sublist.length) {
            $gnblink.attr("href", "javascript:void(0);");
          }
        });
      }
      // Mobile Lang
      $block.find('.header-langbtn').on('click', function() {
        $(this).parent().toggleClass('lang-active');
      });
      // Mobile Top
      $block.find('.btn-momenu').on('click', function() {
        $block.addClass('momenu-active');
        $dim.fadeIn();
      });
      $block.find('.btn-close, .header-dim').on('click', function() {
        $block.removeClass('momenu-active');
        $dim.fadeOut();
      });
      // Mobile Gnb
      $block.find('.header-gnbitem').each(function() {
        const $this = $(this);
        const $thislink = $this.find('.header-gnblink');
        $thislink.on('click', function() {
          if (!$(this).parent().hasClass('item-active')) {
            $('.header-gnbitem').removeClass('item-active');
          }
          $(this).parents(".header-gnbitem").toggleClass("item-active");
        });
      });
      // Menu Btn Click Gnb
      $block.find('.btn-allmenu').on('click', function() {
        $block.addClass('header-menuactive');
        $dim.fadeIn();
      });
      $block.find('.btn-close, .header-dim').on('click', function() {
        $block.removeClass('header-menuactive');
        $dim.fadeOut();
      });
    });
  });
})();