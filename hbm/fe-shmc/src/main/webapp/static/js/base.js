$(function() {	
	
	$(".close_gif").click(function() {
		$(".message_show").addClass("hide");

	});

	$(".ul_menu > li > a").click(function() {
		$(this).siblings('.ul_sub_menu').slideToggle(200);
	})

	$(".block_title em").on("a", "click", function(e) {
		if ($(this).hasClass('slide_up')) {
			$(this).parent().parent().next().addClass("hide");
			$(this).removeClass();
			$(this).addClass("slide_down");
		} else {
			$(this).parent().parent().next().removeClass("hide");
			$(this).removeClass();
			$(this).addClass("slide_up");

		}
	});

	$(".part_title em").delegate("a", "click", function() {
		if ($(this).hasClass('slide_up')) {

			$(this).parent().parent().next().addClass("hide")
			$(this).removeClass();
			$(this).addClass("slide_down");

		} else {

			$(this).parent().parent().next().removeClass("hide")
			$(this).removeClass();
			$(this).addClass("slide_up");

		}
		;

	});

});
