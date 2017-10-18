(define (problem space-problem)
    (:domain spaceship-tourism)

    (:objects sh1 sh2 p1 p2 p3 p4 p5 p6 st1 st2 st3 st4)
    (:init
        (spaceship sh1) (spaceship sh1)

        (passenger p1) (passenger p2) (passenger p3) (passenger p4)
        (passenger p5) (passenger p6)

        (space-station st1) (space-station st2) (space-station st3)
        (space-station st4)

        (passenger-at p1 st3) (passenger-at p5 st3) (passenger-at p6 st3)
        (passenger-at p2 st2) (passenger-at p3 st2)
        (passenger-at p4 st1)

        (ship-at sh1 st4) (ship-at sh2 st4)

        (route-possible st1 st2) (route-possible st1 st4) (route-possible st4 st3)
        (route-possible st2 st2) (route-possible st4 st1) (route-possible st3 st4)
        (has-charge-station st3)

        (= (capacity sh1) 2) (= (capacity sh2) 4)
        (= (current-passengers sh1) 0) (= (current-passengers sh2) 0) ;;possibly not needed bc closed-world assumption?
        (= (flight-time st1 st2) 10) (= (flight-time st1 st4) 40)
        (= (flight-time st4 st3) 10)

        (= (current-fuel sh1) 50) (= (current-fuel sh2) 50)
        (= (max-fuel sh1) 100) (= (max-fuel sh1) 100)

        (= (fuel-required st1 st2) 10) (= (fuel-required st1 st4) 40)
        (= (fuel-required st4 st3) 10)

        (= (total-cost) 0) (= (fuel-unit-cost) 2)
    )
    (:goal
            (and
                (passenger-at p1 st4) (passenger-at p5 st4) (passenger-at p6 st4)
                (passenger-at p2 st4) (passenger-at p3 st4)
                (passenger-at p4 st4)

            )
    )


)
