WebFont.load({
  google: {
    families: ['Raleway:400,500,600', 'Lato:700,900']
  }
});

if($('#slider-shop-fullwidth').length > 0) {
  $('#slider-shop-fullwidth').revolution({
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