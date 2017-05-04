$ ->
  $(document).ready ->
    $('#news-slider').sliderPro
      width: 1126,
      height: 584,
      fade: true,
      arrows: true,
      buttons: false,
      fullScreen: true,
      smallSize: 500,
      mediumSize: 1000,
      largeSize: 3000,
      thumbnailArrows: true,
      autoplay: false
      loop: false
      breakpoints: {
        500: {
          arrows: false
          thumbnailArrows: false
        }
        800: {
          arrows: false
          thumbnailArrows: false
        }
      }
