(define (problem problem-2)
  (:domain warehouse-domain)

  (:objects
    robot1 robot2 - robot
    crate1 crate2 crate3 crate4 - crate
    loc10 loc20 - location
    loading-bay - location
    groupA groupB - group
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

    ;; Crate 1 - Group A, heavy, 10 units away
    (crate-at crate1 loc10)
    (is-heavy crate1)
    (= (weight crate1) 70)
    (crate-group crate1 groupA)

    ;; Crate 2 - Group A, fragile, 20 units away
    (crate-at crate2 loc20)
    (is-heavy crate2)
    (is-fragile crate2)
    (= (weight crate2) 80)
    (crate-group crate2 groupA)

    ;; Crate 3 - Group B, light, 20 units away
    (crate-at crate3 loc20)
    (= (weight crate3) 20)
    (crate-group crate3 groupB)

    ;; Crate 4 - Group B, light, 10 units away
    (crate-at crate4 loc10)
    (= (weight crate4) 30)
    (crate-group crate4 groupB)

     ;; Distance values (for distance-between function)
    (= (distance-between loc10 loading-bay) 10)
    (= (distance-between loading-bay loc10) 10)
    (= (distance-between loc20 loading-bay) 20)
    (= (distance-between loading-bay loc20) 20)

    ;; Recharge station
    (is-loading-bay loading-bay)
    (recharge-station loading-bay)
    
    ;; Group ordering(load group A first then group B)
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
