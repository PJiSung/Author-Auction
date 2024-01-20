// basic-N1 [ivlq80DCv5]
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
// basic-N5 [OylQ80Dcw2]
(function() {
  $(function() {
    $(".basic-N5").each(function() {
      const $block = $(this);
      // Swiper
      const swiper = new Swiper(".basic-N5 .contents-swiper", {
        slidesPerView: 1,
        spaceBetween: 0,
        allowTouchMove: false,
        loop: true,
        autoplay: {
          delay: 5000,
        },
        pagination: {
          el: ".basic-N5 .swiper-pagination",
          type: "fraction",
          clickable: true,
          renderFraction: function(currentClass, totalClass) {
            return '<span class="' + currentClass + '"></span>' + '<span class="contents-deco"></span>' + '<span class="' + totalClass + '"></span>';
          }
        },
        navigation: {
          nextEl: ".basic-N5 .swiper-button-next",
          prevEl: ".basic-N5 .swiper-button-prev",
        },
      });
      // Swiper Play, Pause Button
      const pauseButton = $block.find('.swiper-button-pause');
      const playButton = $block.find('.swiper-button-play');
      playButton.hide();
      pauseButton.show();
      pauseButton.on('click', function() {
        swiper.autoplay.stop();
        playButton.show();
        pauseButton.hide();
      });
      playButton.on('click', function() {
        swiper.autoplay.start();
        playButton.hide();
        pauseButton.show();
      });
    });
  });
})();
// basic-N9 [wzLq80dcyq]
(function() {
  $(function() {
    $(".basic-N9").each(function() {
      const $block = $(this);
      // Swiper
      const swiper = new Swiper(".basic-N9 .contents-swiper", {
        slidesPerView: 'auto',
        allowTouchMove: false,
        spaceBetween: 0,
        loop: true,
        navigation: {
          nextEl: ".basic-N9 .swiper-button-next",
          prevEl: ".basic-N9 .swiper-button-prev",
        },
      });
    });
  });
})();
// basic-N3 [pQlQaJ2sly]
(function() {
  $(function() {
    $(".basic-N3").each(function() {
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
// basic-N51 [FelqAJ2SO7]
(function() {
  $(function() {
    $(".basic-N51").each(function() {
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
// basic-N50 [cRLQaJFRwJ]
(function() {
  $(function() {
    $(".basic-N50").each(function() {
      const $block = $(this);
      const $dim = $block.find('.contents-dim');
      // Mobile Filter Open
      $block.find('.btn-filter').on('click', function() {
        $block.addClass('filter-active');
        $dim.fadeIn();
      });
      // Mobile Filter Close
      $block.find('.btn-close, .contents-dim').on('click', function() {
        $block.removeClass('filter-active');
        $dim.fadeOut();
      });
    });
  });
})();