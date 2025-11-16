(define (problem problem-3)
  (:domain warehouse-domain)

  (:objects
    robot1 robot2 - robot
    crate1 crate2 crate3 crate4 - crate
    loc10 loc20 loc30 loc15 - location
    loading-bay - location
    groupA - group
  )

  (:init
    ;; Robot positions & battery
    (at robot1 loading-bay)
    (at robot2 loading-bay)
    (currently-in-loading-bay robot1)
    (currently-in-loading-bay robot2)
    (free robot1)
    (free robot2)
    (= (battery-level robot1) 20)
    (= (battery-level robot2) 20)

    ;; Crate 1 - Group A, heavy Crate , 10 units away (reachable)
    (crate-at crate1 loc10)
    (is-heavy crate1)
    (= (weight crate1) 70)
    (crate-group crate1 groupA)

    ;; Crate 2 - Group A , fragile heavy crate , 20 units away (reachable)
    (crate-at crate2 loc20)
    (is-heavy crate2)
    (is-fragile crate2)
    (= (weight crate2) 80)
    (crate-group crate2 groupA)

    ;; Crate 3 - Group A , heavy crate, 30 units away (unreachable) handled via relay
    (crate-at crate3 loc30)
    (is-heavy crate3)
    (is-relay-required crate3)
    (= (weight crate3) 60)
    (crate-group crate3 groupA)

    ;; Crate 4 - light crate , 10 units away (reachable)
    (crate-at crate4 loc10)
    (= (weight crate4) 30)
    
     ;; Distance values (for distance-between function)
    (= (distance-between loc10 loading-bay) 10)
    (= (distance-between loading-bay loc10) 10)
    (= (distance-between loc20 loading-bay) 20)
    (= (distance-between loading-bay loc20) 20)
    (= (distance-between loc30 loading-bay) 30)
    (= (distance-between loading-bay loc30) 30)
    (= (distance-between loc15 loading-bay) 15)
    (= (distance-between loading-bay loc15) 15)
    (= (distance-between loc30 loc15) 15)
    (= (distance-between loc15 loc30) 15)
    
    ;; Recharge station
    (is-loading-bay loading-bay)
    (recharge-station loading-bay)

    ;; Midpoint location definition
    (is-midpoint loc15)

    ;; Group ordering
    (group-next crate1 crate2)
    (group-next crate2 crate3)
    (group-next crate3 crate4)
  )

  (:goal
    (and
      (crate-loaded crate1)
      (crate-loaded crate2)
      (crate-loaded crate3)
      (crate-loaded crate4)
    )
  )
  (:metric minimize (total-time))
)