;; Problem situation with 2 ships capable of carying 4 persons.

(define (problem space-problem2)
    (:domain spaceship-travel)

    (:objects sh1 - spaceship
              sh2 - spaceship

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



        (ship-at sh1 earth)
        (ship-at sh2 earth)
        (ready-boarding sh1)
        (ready-boarding sh2)

        (ready-for-recharging sh1)
        (ready-for-recharging sh2)

        (= (current-fuel sh1) 50)
        (= (max-fuel sh1) 200)
        (= (capacity sh1) 4)

        (= (current-fuel sh2) 50)
        (= (max-fuel sh2) 200)
        (= (capacity sh2) 4)

        (= (current-passengers sh1) 0)
        (= (current-passengers sh2) 0)


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
        (= (flight-time earth st1) 10)
        (= (flight-time st1 earth) 2)
        (= (fuel-required earth st1) 100)
        (= (fuel-required st1 earth) 5)


        (route-possible st1 st2) (route-possible st2 st3) (route-possible st3 st4)
        (route-possible st1 st3)
        (route-possible st2 st1) (route-possible st3 st2) (route-possible st4 st3)
        (route-possible st3 st1)

        (has-fuel-station st3)

        (= (flight-time st1 st2) 10) (= (flight-time st2 st3) 40)  (= (flight-time st3 st4) 90)
        (= (flight-time st1 st3) 50)
        (= (flight-time st2 st1) 20) (= (flight-time st4 st2) 40) (= (flight-time st4 st3) 90)
        (= (flight-time st3 st1) 50)


        (= (fuel-required st1 st2) 10) (= (fuel-required st2 st3) 40)  (= (fuel-required st3 st4) 90)
        (= (fuel-required st1 st3) 50)
        (= (fuel-required st2 st1) 10) (= (flight-time st4 st2) 40) (= (fuel-required st4 st3) 90)
        (= (fuel-required st3 st1) 50)

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
