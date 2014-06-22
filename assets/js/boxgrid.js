$(function() {

  // See: http://bl.ocks.org/mbostock/5577023
  var colorBrewerColors = [
    "Greys",
    "Oranges",
    "Reds",
    "RdPu",
    "Purples",
    "Blues",
    "Greens",
    ];
  var rainbow = window.Trianglify.colorbrewer["Spectral"][11];
  rainbow.unshift.apply(rainbow, rainbow.splice(6, rainbow.length));

  // http://stackoverflow.com/a/8876069/114157
  var w = Math.max(document.documentElement.clientWidth, window.innerWidth || 0) * 0.75;
  var h = Math.max(document.documentElement.clientHeight, window.innerHeight || 0) * 0.75;

  var t = new window.Trianglify({
    noiseIntensity: 0,
    x_gradient: rainbow,
    y_gradient: rainbow.reverse(),
  });
  var pattern = t.generate(w, h);
  $(".bg-header").css("background-image", pattern.dataUrl);

  $(".bg-row").each(function(index, el) {
    var t = new window.Trianglify({
      noiseIntensity: 0,
      x_gradient: window.Trianglify.colorbrewer[colorBrewerColors[index]][9].slice(4),
      y_gradient: window.Trianglify.colorbrewer[colorBrewerColors[index]][9].slice(4).reverse() });
    var pattern = t.generate(w, h);
    $(el).css("background-image", pattern.dataUrl);
  });

  var paddingTop = 0;
  if ($(".js-bg-nav-dropdown").length > 0) {
    var drop = new Drop({
     target: $('.js-bg-selector')[0],
     content: $('.js-bg-nav-dropdown')[0],
     position: 'bottom center',
     classes: 'drop-theme-arrows-bounce-dark',
     openOn: 'click'
    });
    paddingTop = "3.5rem";
  }

  $('.fullpage').fullpage({
    paddingTop: paddingTop,
    scrollOverflow: true,
    resize: false,
    anchors: ["intro", "page1", "page2", "page3", "page4", "page5", "page6"],
    menu: ".js-big-menu",
    onLeave: function(index, nextIndex, direction) {
      $("a[data-bg-index='" + index + "']").addClass("is-inactive");
      $("a[data-bg-index='" + nextIndex + "']").removeClass("is-inactive");
    }
  });

  // Slimscroll didn't work well so using nanoScroller instead.
  // TODO: scrolling using mouse scroll triggers fullpage scroll...
  $(".nano").nanoScroller({
    preventPageScrolling: true,
    alwaysVisible: true
  });
;
});
