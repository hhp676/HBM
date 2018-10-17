$(function () {

    // logout
    $("#index-logout-btn").click(function () {
        HgUi.confirm('系统提示', '确认注销登录?', function (confirmData) {
            if(confirmData){
                $.ajax({
                    "url": G_CTX_PATH + "/logout?etc=" + new Date().getTime(),
                    "success": function () {
                        window.location.href = G_CTX_ADMIN_PATH;
                    }
                })
            }
        });
    });

    // slideToTop
    var slideToTop = $("<div />");
    slideToTop.html('<i class="fa fa-chevron-up"></i>');
    slideToTop.css({
        position: 'fixed',
        bottom: '20px',
        right: '25px',
        width: '40px',
        height: '40px',
        color: '#eee',
        'font-size': '',
        'line-height': '40px',
        'text-align': 'center',
        'background-color': '#222d32',
        cursor: 'pointer',
        'border-radius': '5px',
        'z-index': '99999',
        opacity: '.7',
        'display': 'none'
    });
    slideToTop.on('mouseenter', function () {
        $(this).css('opacity', '1');
    });
    slideToTop.on('mouseout', function () {
        $(this).css('opacity', '.7');
    });
    $('.wrapper').append(slideToTop);
    $(window).scroll(function () {
        if ($(window).scrollTop() >= 150) {
            if (!$(slideToTop).is(':visible')) {
                $(slideToTop).fadeIn(500);
            }
        } else {
            $(slideToTop).fadeOut(500);
        }
    });
    $(slideToTop).click(function () {
        $("body").animate({
            scrollTop: 0
        }, 100);
    });

    $(".sidebar-menu li").click(function(){
        if ($(this).has("a").length==0){
            return;
        }
        var o = $(this).siblings(".active");
        $(o).removeClass("active");
        $(o).find("li.active").removeClass("active");
        $(o).find("ul").hide();
        $(this).addClass("active");

        if ($(this).has("ul.treeview-menu").length>0){
            return;
        }

        var smallTitle =  $(this).find("li.active a").text();
        $("section.content-header >h1").html($(this).children("a").text()+"<small>"+smallTitle+"</small>");
        var uri = $(this).children("a").attr("uri");
        $("section.content").load(uri, function(){
        });
        //return false;

    })
    $(".sidebar-menu li.active").click();

});
