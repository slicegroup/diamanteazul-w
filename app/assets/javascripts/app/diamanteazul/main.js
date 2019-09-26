WebFont.load({
  google: {
    families: ['Raleway:400,500,600', 'Lato:400,700,900']
  }
});

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
  arrows: false,
  responsive: [
    {
      breakpoint: 480,
      settings: {
        slidesToShow: 2,
      }
    }
  ]
});
  

$('.single-item').slick({
  arrows: false,
  dots: true,
  autoplay: true,
  autoplaySpeed: 2000,
  fade: true,
  infinite: true,
  pauseOnHover: false
});
