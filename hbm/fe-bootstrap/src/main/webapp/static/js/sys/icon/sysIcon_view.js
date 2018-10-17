/* Font Awesome Search */
$("#fontawsome-search").keyup(function() {
	var term = $.trim(this.value);
	if (term === ""){
		$(".fa-hover").show();
		$('#fontawesome-container .alert').parent().show();
		$('#fontawesome-container section').each(function() {
			$(this).css('display', 'block');
		});
	}
	else{
		$('.fa-hover > i[class*="fa-"]').parent().hide();
		$('.fa-hover > i[class*="' + term + '"]').parent().show();
		$('#fontawesome-container .alert').parent().hide();
		$('#fontawesome-container section').each(function() {
			if ($(this).find("div").children(':visible').length == 0){
				$(this).css('display', 'none');
			}
		});
	}
});


/*GlyphIcon Search*/
$("#glyphicon-search")
    .keyup(function () {
        var term = $.trim(this.value);
        if (term === "") {
            $(".bs-glyphicons-list li")
                .show();
        } else {
            $('.bs-glyphicons-list li > span[class*="glyphicon-"]')
                .parent()
                .hide();
            $('.bs-glyphicons-list li > span[class*="' + term + '"]')
                .parent()
                .show();
        }
});



/*Typicon Search*/
$("#typicon-search")
    .keyup(function () {
        var term = $.trim(this.value);
        if (term === "") {
            $("#typicon-preview .icon")
                .show();
        } else {
            $('#typicon-preview .icon')
                .hide();
            $('#typicon-preview .icon span[class*="' + term + '"]')
                .parent()
                .show();
        }
    });


/*WeatherIcon Search*/
$("#weathericon-search")
    .keyup(function () {
        var term = $.trim(this.value);
        if (term === "") {
            $(".weathericons")
                .show();
        } else {
            $('.weathericons')
                .hide();
            $('.weathericons i[class*="' + term + '"]')
                .parent()
                .parent()
                .show();
        }
    });

