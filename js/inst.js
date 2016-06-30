$(document).ready(function () {
    /****** Facility information page********/
    $('.link-infoinst').hover(function () {
        $(this).css('cursor', 'pointer');
    }, function () {

    });

    $('.link-infoinst').click(function () {
        if ($(this).parent().hasClass('active')) {
            var idlinkTab = $(this).attr('href');
            $('li.active').removeClass('active');
            $(idlinkTab).removeClass('active');
            return false;
        }
    });

    // View / Hide Round facility
    var CHECK_VIEWED_ICON = true;
    $('#view-hide-rel-inst').click(function (e) {
        if (CHECK_VIEWED_ICON) {
            $('#view-hide-rel-inst > i').removeClass('icon-chevron-down');
            $('#view-hide-rel-inst > i').addClass('icon-chevron-up');
            $('.inst-nearby-item').slideDown(500);
            $('body').animate({scrollTop: parseInt($(".inst-nearby-item").offset().top)}, 1000);
            $('#view-hide-rel-inst > span').text('Cacher');
            CHECK_VIEWED_ICON = false;
        } else {
            $('#view-hide-rel-inst > i').removeClass('icon-chevron-up');
            $('#view-hide-rel-inst > i').addClass('icon-chevron-down');
            $('#view-hide-rel-inst > span').text('Afficher');
            $('.inst-nearby-item').slideUp(500);
            CHECK_VIEWED_ICON = true;

        }
        e.preventDefault();
    });
});