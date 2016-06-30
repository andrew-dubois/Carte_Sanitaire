function SetupLegend() {
    //display / hide legend
    $('#btn_arrow').click(function (e) {
        $('#legendFac').animate({
            right: "-200px"
        }, {duration: 100,
            complete: function () {
                $('#legendFac_btnShow').animate({
                    right: "0"
                }, {
                    duration: 100
                });
            }
        }
        );
        e.preventDefault();
    });

    //show legend
    $('#legendFac_btnShow a').click(function (e) {
        $('#legendFac').animate({
            right: "0px"
        }, {duration: 100,
            complete: function () {
                $('#legendFac_btnShow').animate({
                    right: "-200px"
                }, {
                    duration: 100
                });
            }
        }
        );
        e.preventDefault();
    });
}