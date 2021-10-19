import { Controller } from "stimulus"

export default class extends Controller {

    static targets = ["hora"]

    initialize() {}
    connect() {
        this.time()

    }


    time() {

        function startTimer(duration, display) {

            var timer = duration,
                minutes, seconds;


            setInterval(function() {
                minutes = parseInt(timer / 60, 10)
                seconds = parseInt(timer % 60, 10);

                minutes = minutes < 10 ? "0" + minutes : minutes;
                seconds = seconds < 10 ? "0" + seconds : seconds;

                display.text(minutes + ":" + seconds);



                if (--timer < 0) {
                    timer = duration;
                }
            }, 1000);
        }

        var fiveMinutes = 60 * 30
        var display = $(this.horaTarget)
        startTimer(fiveMinutes, display)



    }


}