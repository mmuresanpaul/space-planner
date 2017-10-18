(define (domain spaceship-travel)
	(:requirements :typing :durative-actions :action-costs :numeric-fluents :duration-inequalities)
	(:types	spaceship - object
			passenger - object
			space-station - object
	)

	(:predicates
		(passenger-at ?p - passenger ?station - space-station)
		(ship-at ?sh - spaceship ?st - space-station)
		(passenger-onboard ?p - passenger ?s - spaceship)
		(route-possible ?s1 - space-station ?s2 - space-station)
		(has-fuel-station ?s1 - space-station)
		(ready-boarding ?ship - spaceship)
		(ready-for-refueling ?ship - spaceship)
	)

	(:functions
		(capacity ?s - spaceship) - number
		(current-passengers ?s - spaceship) - number
		(flight-time ?s1 - space-station ?s2 - space-station) - number
		(current-fuel ?s - spaceship) - number
		(max-fuel ?s - spaceship) - number
		(amount-to-refuel ?s - spaceship) - number
		(fuel-required ?s1 - space-station ?s2 - space-station) - number
		(total-cost) - number
		(fuel-unit-cost) - number ;;price for one unit of fuel
	)

	(:durative-action travel :parameters (?ship - spaceship ?s1 - space-station ?s2 - space-station)
		:duration (= ?duration (flight-time ?s1 ?s2))
		:condition (and
						(at start(ship-at ?ship ?s1))
						(at start(route-possible ?s1 ?s2 ))
						(at start(>= (current-fuel ?ship) (fuel-required ?s1 ?s2)))
				    )
		:effect (and
					(at start(not(ship-at ?ship ?s1)))
					(at end(ship-at ?ship ?s2))
					(at end(decrease (current-fuel ?ship) (fuel-required ?s1 ?s2)))
					(at end (increase (total-cost) (fuel-required ?s1 ?s2)))
				)
	)

	(:durative-action board :parameters (?ship - spaceship ?s1 - space-station ?p - passenger)
		:duration (= ?duration 5 )
		:condition (and
						(at start (passenger-at ?p ?s1))
						(at start (ship-at ?ship ?s1))
						(over all (ship-at ?ship ?s1))
						(at start (< (current-passengers ?ship) (capacity ?ship)))
						(at start(ready-boarding ?ship))
				   )

		:effect (and
					(at start (not (passenger-at ?p ?s1)))
					(at end (passenger-onboard ?p ?ship))
					(at end(increase (current-passengers ?ship) 1))
					;prevent all passengers from boarding at once
					(at start(not (ready-boarding ?ship)))
					(at end(ready-boarding ?ship))
				)
	)

	(:durative-action unboard :parameters (?ship - spaceship ?s1 - space-station ?p - passenger)
		:duration (= ?duration 1)
		:condition (and
						(at start(passenger-onboard ?p ?ship))
						(at start(ship-at ?ship ?s1))
						(over all (ship-at ?ship ?s1))
						(at start(ready-boarding ?ship))
				   )
	     :effect (and
			 		(at start (not (passenger-onboard ?p ?ship)))
					(at end (passenger-at ?p ?s1))
					(at end(decrease (current-passengers ?ship) 1))
					;prevent all passengers from boarding at once
					(at start(not (ready-boarding ?ship)))
					(at end(ready-boarding ?ship))
				 )
	)

	(:durative-action refuel :parameters (?ship - spaceship ?s1 - space-station)
			:duration(= ?duration (-(max-fuel ?ship)(current-fuel ?ship)))
			:condition (and
						(at start(ship-at ?ship ?s1))
						(over all(ship-at ?ship ?s1))
						(at start(has-fuel-station ?s1))
						(at start (ready-for-refueling ?ship))
				    )
			:effect (and
								(at start (not (ready-for-refueling ?ship)))
								(at end (ready-for-refueling ?ship))
								(at end(assign(current-fuel ?ship) (max-fuel ?ship)))
		      )
	)
)
