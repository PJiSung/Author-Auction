// hooms-N54 [luLQc2z4Dg]
(function() {
  $(function() {
    $(".hooms-N54").each(function() {
      const $block = $(this);
      const $dim = $block.find(".header-dim");
      // Header Scroll
      $(window).on("load scroll", function() {
        const $thisTop = $(this).scrollTop();
        if ($thisTop > 0) {
          $block.addClass("header-top-active");
        } else {
          $block.removeClass("header-top-active");
        }
      });
      // Gnb DecoLine
      $block.find(".header-gnbitem").each(function() {
        const $this = $(this);
        $this.on("mouseover", function() {
          $this.find(".header-gnblink").addClass("on");
        });
        $this.on("mouseout", function() {
          $this.find(".header-gnblink").removeClass("on");
        });
      });
      // Header SearchForm
      $block.find(".btn-search").on("click", function() {
        $block.addClass("header-search-active");
        $dim.fadeIn();
      });
      $block.find(".btn-close, .header-dim").on("click", function() {
        $block.removeClass("header-search-active");
        $dim.fadeOut();
      });
      // Full Gnb
      $block.find(".btn-menu").on("click", function() {
        $block.find(".header-fullmenu-dark").addClass("fullmenu-active");
        $block.find(".header-fullmenu-dark .fullmenu-gnbitem .fullmenu-img").show();
      });
      $block.find(".fullmenu-close").on("click", function() {
        $block.find(".header-fullmenu-dark").removeClass("fullmenu-active");
      });
      // Full Gnb Hover
      $block.find(".fullmenu-gnbitem").each(function() {
        const $this = $(this);
        const thisIndex = $this.index();
        $this.find(".fullmenu-gnblink").on("mouseover", function() {
          $block.find(".fullmenu-gnbitem").removeClass("fullmenu-item-active");
          $this.addClass("fullmenu-item-active");
          // Full Gnb Background Img
          const $headerFullmenu = $block.find(".header-fullmenu-dark");
          const classesToRemove = $headerFullmenu.attr("class").split(" ").filter(function(fuillmenu) {
            return fuillmenu.startsWith("header-fullmenu-bg");
          });
          $headerFullmenu.removeClass(classesToRemove.join(" "));
          $headerFullmenu.addClass("header-fullmenu-bg" + thisIndex);
        });
      });
      // Header Mobile 1Depth Click
      if (window.innerWidth <= 992) {
        $(".fullmenu-gnbitem").each(function() {
          const $sublist = $(this).find(".fullmenu-sublist");
          if ($sublist.length) {
            $(this).find(".fullmenu-gnblink").attr("href", "javascript:void(0);");
          }
        });
      }
    });
  });
})();
// hooms-N1 [OMlqC2Z4e4]
(function() {
  $(function() {
    $(".hooms-N1").each(function() {
      const $block = $(this);
      // Swiper
      const swiper = new Swiper(".hooms-N1 .contents-swiper", {
        slidesPerView: 1,
        spaceBetween: 0,
        allowTouchMove: false,
        loop: true,
        autoplay: {
          delay: 5000,
        },
        pagination: {
          el: ".hooms-N1 .swiper-pagination",
          clickable: true,
        },
        navigation: {
          nextEl: ".hooms-N1 .swiper-button-next",
          prevEl: ".hooms-N1 .swiper-button-prev",
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
// hooms-N7 [pMlqC2z4fR]
(function() {
  $(function() {
    $(".hooms-N7").each(function() {
      const $block = $(this);
      // Swiper
      const swiper = new Swiper(".hooms-N7 .contents-swiper", {
        slidesPerView: 'auto',
        allowTouchMove: false,
        loop: true,
        pagination: {
          type: "progressbar",
          el: ".hooms-N7 .swiper-pagination",
          clickable: true,
        },
        autoplay: {
          delay: 2500,
        },
        on: {
          slideChange: function() {
            $block.find('.contents-slide').removeClass('contents-price-active');
            const activeIndex = this.activeIndex % this.slides.length;
            $block.find('.contents-slide').eq(activeIndex).addClass('contents-price-active');
          }
        }
      });
    });
  });
})();;
// hooms-N40 [tPlqTwjtZw]
(function() {
  $(function() {
    $(".hooms-N40").each(function() {
      const $block = $(this);
      const $thumbnail = $block.find('.contents-thumbnail img');
      const $thumbitem = $block.find('.contents-thumbitem img');
      // Thumbnail Click Event
      $thumbitem.each(function(index, element) {
        var $this = $(this);
        $this.on("click", changePic);
      });

      function changePic() {
        var newPic = $(this).attr("src");
        $thumbnail.attr("src", newPic);
      }
    });
  });
})();;