(define (problem problem-4)
  (:domain warehouse-domain)

  (:objects
    robot1 robot2 - robot
    crate1 crate2 crate3 crate4 crate5 crate6 - crate
    loc10 loc20 loc30 - location
    loading-bay - location
    groupA groupB  - group
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

    ;; Crate 1 - Group A, light , 20 units away
    (crate-at crate1 loc20)
    (= (weight crate1) 30)
    (= (distance crate1) 20)
    (crate-group crate1 groupA)

    ;; Crate 2 - Group A, fragile, 20 units away
    (crate-at crate2 loc20)
    (is-fragile crate2)
    (= (weight crate2) 20)
    (crate-group crate2 groupA)

    ;; Crate 3 - Group B, fragile, 10 units away
    (crate-at crate3 loc10)
    (is-fragile crate3)
    (= (weight crate3) 30)
    (crate-group crate3 groupB)
    
    ;; Crate 4 - Group B, fragile, 20 units away
    (crate-at crate4 loc20)
    (is-fragile crate4)
    (= (weight crate4) 20)
    (crate-group crate4 groupB)
    
    ;; Crate 5 - Group B, fragile, 30 units away
    (crate-at crate5 loc30)
    (is-fragile crate5)
    (= (weight crate5) 30)
    (crate-group crate5 groupB)
    
    ;; Crate 6 - Group A, light , 10 units away
    (crate-at crate6 loc10)
    (= (weight crate6) 20)

    
    ;; Distance values (for distance-between function)
    (= (distance-between loc10 loading-bay) 10)
    (= (distance-between loading-bay loc10) 10)
    (= (distance-between loc20 loading-bay) 20)
    (= (distance-between loading-bay loc20) 20)
    (= (distance-between loading-bay loc30) 30)
    (= (distance-between loc30 loading-bay) 30)
    

    ;; Recharge station
    (is-loading-bay loading-bay)
    (recharge-station loading-bay)
    
    ;; Group ordering (load group A then group B , and then the rest)
    (group-next crate1 crate2)
    (group-next crate2 crate3)
    (group-next crate3 crate4)
    (group-next crate4 crate5)
    (group-next crate5 crate6)

  )

  (:goal
    (and
      (crate-loaded crate1)
      (crate-loaded crate2)
      (crate-loaded crate3)
      (crate-loaded crate4)
      (crate-loaded crate5)
      (crate-loaded crate6)
    )
  )
 (:metric minimize (total-time))
)
