;; Problem situation with 8 ships capable of carying 1 person.

(define (problem space-problem0)
    (:domain spaceship-travel)

    (:objects sh1 - spaceship
              sh2 - spaceship
              sh3 - spaceship
              sh4 - spaceship
              sh5 - spaceship
              sh6 - spaceship
              sh7 - spaceship
              sh8 - spaceship

              p1 - passenger
              p2 - passenger
              p3 - passenger
              p4 - passenger
              p5 - passenger
              p6 - passenger
              p7 - passenger
              p8 - passenger
              p9 - passenger
              p10 - passenger
              p11 - passenger
              p12 - passenger
              p13 - passenger
              p14 - passenger
              p15 - passenger
              p16 - passenger

              earth - space-station
              st1 - space-station
              st2 - space-station
              st3 - space-station
              st4 - space-station)
    (:init



        (ship-at sh1 earth) (ship-at sh2 earth) (ship-at sh3 earth) (ship-at sh4 earth)
        (ship-at sh5 earth) (ship-at sh6 earth) (ship-at sh7 earth) (ship-at sh8 earth)
        (ready-boarding sh1)
        (ready-boarding sh2)
        (ready-boarding sh3)
        (ready-boarding sh4)
        (ready-boarding sh5)
        (ready-boarding sh6)
        (ready-boarding sh7)
        (ready-boarding sh8)

        (ready-for-refueling sh1)
        (ready-for-refueling sh2)
        (ready-for-refueling sh3)
        (ready-for-refueling sh4)
        (ready-for-refueling sh5)
        (ready-for-refueling sh6)
        (ready-for-refueling sh7)
        (ready-for-refueling sh8)

        (= (current-fuel sh1) 150) (= (current-fuel sh2) 150)
        (= (max-fuel sh1) 150) (= (max-fuel sh2) 150)
        (= (current-fuel sh3) 150) (= (current-fuel sh4) 150)
        (= (max-fuel sh3) 150) (= (max-fuel sh4) 150)
        (= (current-fuel sh5) 150) (= (current-fuel sh6) 150)
        (= (max-fuel sh5) 150) (= (max-fuel sh6) 150)
        (= (current-fuel sh7) 150) (= (current-fuel sh8) 150)
        (= (max-fuel sh7) 150) (= (max-fuel sh8) 150)


        (= (capacity sh1) 1) (= (capacity sh2) 1) (= (capacity sh3) 1)  (= (capacity sh4) 1)
        (= (capacity sh5) 1) (= (capacity sh6) 1) (= (capacity sh7) 1)  (= (capacity sh8) 1)

        (= (current-passengers sh1) 0) (= (current-passengers sh2) 0) (= (current-passengers sh3) 0) (= (current-passengers sh4) 0)
        (= (current-passengers sh5) 0) (= (current-passengers sh6) 0) (= (current-passengers sh7) 0) (= (current-passengers sh8) 0)



        (passenger-at p1 st1)
        (passenger-at p2 st1)
        (passenger-at p3 st1)
        (passenger-at p4 st1)

        (passenger-at p5 st2)
        (passenger-at p6 st2)
        (passenger-at p7 st2)
        (passenger-at p8 st2)

        (passenger-at p9 st3)
        (passenger-at p10 st3)
        (passenger-at p11 st3)
        (passenger-at p12 st3)

        (passenger-at p13 st4)
        (passenger-at p14 st4)
        (passenger-at p15 st4)
        (passenger-at p16 st4)

        (route-possible earth st1)
        (route-possible st1 earth)
        (has-fuel-station earth)
        (= (flight-time earth st1) 5)
        (= (flight-time st1 earth) 1)
        (= (fuel-required earth st1) 1)
        (= (fuel-required st1 earth) 1)


        (route-possible st1 st2) (route-possible st2 st3) (route-possible st3 st4)
        (route-possible st1 st3)
        (route-possible st2 st1) (route-possible st3 st2) (route-possible st4 st3)
        (route-possible st3 st1)

        (has-fuel-station st3)

        (= (flight-time st1 st2) 5) (= (flight-time st2 st3) 20)  (= (flight-time st3 st4) 45)
        (= (flight-time st1 st3) 25)
        (= (flight-time st2 st1) 5) (= (flight-time st4 st2) 45) (= (flight-time st4 st3) 45)
        (= (flight-time st3 st1) 25)


        (= (fuel-required st1 st2) 2) (= (fuel-required st2 st3) 12)  (= (fuel-required st3 st4) 22)
        (= (fuel-required st1 st3) 12)
        (= (fuel-required st2 st1) 2) (= (flight-time st4 st2) 10) (= (fuel-required st4 st3) 22)
        (= (fuel-required st3 st1) 12)

        (= (total-cost) 0)
        (= (fuel-unit-cost) 2)
    )
    (:goal
            (and
              (passenger-at p1 earth)
              (passenger-at p2 earth)
              (passenger-at p3 earth)
              (passenger-at p4 earth)

              (passenger-at p5 earth)
              (passenger-at p6 earth)
              (passenger-at p7 earth)
              (passenger-at p8 earth)

              (passenger-at p9 earth)
              (passenger-at p10 earth)
              (passenger-at p11 earth)
              (passenger-at p12 earth)

              (passenger-at p13 earth)
              (passenger-at p14 earth)
              (passenger-at p15 earth)
              (passenger-at p16 earth)

            )
    )
    (:metric minimize (total-cost))

)
