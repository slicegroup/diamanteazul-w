WebFont.load({
  google: {
    families: ['Raleway:400,500,600', 'Lato:700,900']
  }
});

if($('#slider-shop-fullwidth').length > 0) {
  $('#slider-shop-fullwidth').revolution({
    gridwidth: 1570,
    gridheight: 500,
    disableProgressBar: 'on',
    delay: 4000,
    navigation: {
      onHoverStop: "off",
      arrows: {enable: true},
      touch: {
        touchenabled: "on",
        swipe_threshold: 75,
        swipe_min_touches: 1,
        swipe_direction: "horizontal",
        drag_block_vertical: false
      },
    },
  });
}

$('.product-images-for').slick({
  slidesToShow: 1,
  slidesToScroll: 1,
  arrows: false,
  fade: true,
  asNavFor: '.product-images-nav'
});
$('.product-images-nav').slick({
  slidesToShow: 3,
  slidesToScroll: 1,
  asNavFor: '.product-images-for',
  dots: true,
  centerMode: true,
  focusOnSelect: true,
  arrows: false
});
  

$('.single-item').slick({
  arrows: true,
  autoplay: true,
  autoplaySpeed: 2000,
  fade: true,
  infinite: true,
  pauseOnHover: false
});
