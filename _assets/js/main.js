$(document).ready(function() {

    var wd = $(window).width();
    if (wd > 767) {
        var main_height = $(".two-column-area .left_area_panel").height();

        $(".two-column-area .side_panel").css('min-height', main_height);
    }

    $(".search_properti").click(function(e) {
        $(".searchbox_content input[type='submit']").trigger("click");
    });

    //===== Feature Page ====//
    $(".feature-menu ul li").each(function() {
        $(this).find("a").click(function() {
            var hrf = $(this).attr("href");
            $('html, body').animate({
                scrollTop: $(hrf).offset().top
            }, 3000);
        });

    });



    //=======Faq============//

    $(".faq-question a").click(function(e) {
        $(this).toggleClass("active");
    });


    $(".grid-list ul li a").click(function(event) {
        event.preventDefault();
        $(this).parent().addClass("selected");
        $(this).parent().siblings().removeClass("selected");
        var tab = $(this).attr("href");
        $(".tab-content").not(tab).css("display", "none");
        $(tab).fadeIn();
    });
	
});




// Slider

$('.hero-slider').slick({
    
    speed: 2000,
    slidesToShow: 1,
    autoplay: true,
    autoplaySpeed: 5000,
    slide: 'li',
    fade: true,
    infinite: true,
	pauseOnHover: false,
});

$('.marin-region-slider').slick({
    
    speed: 2000,
    slidesToShow: 1,
    autoplay: true,
    autoplaySpeed: 5000,
    slide: 'li',
    fade: true,
    infinite: true,
	arrows: false,
	pauseOnHover: false,
});

$('.sonoma-region-slider').slick({
    
    speed: 2000,
    slidesToShow: 1,
    autoplay: true,
    autoplaySpeed: 4500,
    slide: 'li',
    fade: true,
    infinite: true,
	arrows: false,
	pauseOnHover: false,
});

$('.recent-slider').slick({
    
    speed: 300,
    slidesToShow: 1,
    autoplay: false,
    autoplaySpeed: 3000,
    slide: 'li',
    infinite: true,
    arrows: true,
	pauseOnHover: false,
});
$('.two-col-slider').slick({
    arrows: true,
    speed: 1200,
    slidesToShow: 2,
    slidesToScroll: 1,
    centerMode: false,
    autoplay: true,
    touchMove: true,
    slide: 'li',
	pauseOnHover: false,
    responsive: [{
        breakpoint: 599,
        settings: {
            slidesToShow: 1,
            slidesToScroll: 1
        }

    }]
});




$('.three-col-slider').slick({
    arrows: true,
    speed: 1200,
    slidesToShow: 3,
    slidesToScroll: 1,
    centerMode: false,
    autoplay: true,
    touchMove: true,
    slide: 'li',
	pauseOnHover: false,
    responsive: [{
            breakpoint: 767,
            settings: {
                slidesToShow: 2,
                slidesToScroll: 1
            }
        },
        {
            breakpoint: 480,
            settings: {
                slidesToShow: 1,
                slidesToScroll: 1
            }
        }

    ]
});

$('.four-col-slider-marin').slick({
    arrows: true,
    speed: 1700,
    slidesToShow: 4,
    slidesToScroll: 1,
    centerMode: false,
    autoplay: true,
    touchMove: true,
    slide: 'li',
	pauseOnHover: false,
    responsive: [{
            breakpoint: 991,
            settings: {
                slidesToShow: 3,
                slidesToScroll: 1
            }
        },
        {
            breakpoint: 640,
            settings: {
                slidesToShow: 2,
                slidesToScroll: 1
            }
        },
        {
            breakpoint: 480,
            settings: {
                slidesToShow: 1,
                slidesToScroll: 1
            }
        }

    ]
});

$('.four-col-slider').slick({
    arrows: true,
    speed: 1200,
    slidesToShow: 4,
    slidesToScroll: 1,
    centerMode: false,
    autoplay: true,
    touchMove: true,
    slide: 'li',
	pauseOnHover: false,
    responsive: [{
            breakpoint: 991,
            settings: {
                slidesToShow: 3,
                slidesToScroll: 1
            }
        },
        {
            breakpoint: 640,
            settings: {
                slidesToShow: 2,
                slidesToScroll: 1
            }
        },
        {
            breakpoint: 480,
            settings: {
                slidesToShow: 1,
                slidesToScroll: 1
            }
        }

    ]
});


$('.logo-slider').slick({
    arrows: false,
    speed: 1200,
    slidesToShow: 5,
    slidesToScroll: 1,
    centerMode: false,
    autoplay: true,
    touchMove: true,
    slide: 'li',
	pauseOnHover: false,
    responsive: [{
            breakpoint: 1025,
            settings: {
                slidesToShow: 4,
                slidesToScroll: 1
            }
        },
        {
            breakpoint: 767,
            settings: {
                slidesToShow: 3,
                slidesToScroll: 1
            }
        },
        {
            breakpoint: 642,
            settings: {
                slidesToShow: 2,
                slidesToScroll: 1
            }
        },
        {
            breakpoint: 480,
            settings: {
                slidesToShow: 1,
                slidesToScroll: 1
            }
        }

    ]
});


$('.testimonial-slider').slick({
    dots: true,
    speed: 2500,
    slidesToShow: 1,
    touchMove: false,
    slide: 'li',
    autoplay: true,
    autoplaySpeed: 5000,
	pauseOnHover: false,
});




$('.slider-for').slick({
    slidesToShow: 1,
    slidesToScroll: 1,
    arrows: false,
    fade: true,
    asNavFor: '.slider-nav'
});
$('.slider-nav').slick({
    slidesToShow: 4,
    slidesToScroll: 1,
    asNavFor: '.slider-for',
    dots: true,
    centerMode: false,
    focusOnSelect: true
});

/* Scroll to top button */
$(window).bind("scroll", function(){

	/* Scroll Top Btn */
	if ($(this).scrollTop() > $(window).height()-1) {
		$('.scrollup').fadeIn();
	} else {
		$('.scrollup').fadeOut();
	}
});

$('.scrollup').click(function(){
$("html, body").animate({ scrollTop: 0 }, 1000);
return false;
});

///* Sticky Nav */
//var  mn = $(".primary-nav");
//    mns = "primary-nav-scrolled";
//    hdr = $('.utility-nav').height();
//
//$(window).scroll(function() {
//  if( $(this).scrollTop() > hdr ) {
//    mn.addClass(mns);
//  } else {
//    mn.removeClass(mns);
//  }
//});

/*Menu Scroll start*/

var s = $("#menu-offscroll");
var pos = s.position();
var scrollmenu = $("#menu-offscroll");
var scrollmenu_pos = scrollmenu.position();
var windowpos = $(window).scrollTop();

if (windowpos - scrollmenu_pos.top > 150) {
	s.addClass("menu-onscroll");
	s.addClass("fadeInDown", 1000);
}
else {
	s.removeClass("menu-onscroll");
	s.removeClass("fadeInDown");
}

$(window).scroll(function () {
	windowpos = $(window).scrollTop();
	if (windowpos - scrollmenu_pos.top > 150) {
		s.addClass("menu-onscroll");
		s.addClass("fadeInDown", 1000);
	}
	else {
		s.removeClass("menu-onscroll");
		s.removeClass("fadeInDown", 300);
	}
});
/*Menu Scroll end*/


/*Sort Web App Item By Date*/
//(function($){
//    var container = $(".sort-list");
//    var items = $(".sort-item");
//    
//    items.each(function() {
//       // Convert the string in 'data-event-date' attribute to a more
//       // standardized date format
//       var BCDate = $(this).attr("data-event-date").split("-");
//       var standardDate = BCDate[1]+" "+BCDate[0]+" "+BCDate[2];
//       standardDate = new Date(standardDate).getTime();
//       $(this).attr("data-event-date", standardDate);
// 
//    });
//    
//
//    items.sort(function(a,b){
//        a = parseFloat($(a).attr("data-event-date"));
//        b = parseFloat($(b).attr("data-event-date"));
//        return a>b ? -1 : a<b ? 1 : 0;
//    }).each(function(){
//        container.prepend(this);
//    });
//
//});

/* This script sorts your list in descending order... to change it to ascending order change the "less than" operator (<) to "greater than" (>) */