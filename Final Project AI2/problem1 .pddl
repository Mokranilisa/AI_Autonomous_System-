(define (problem problem-1)
  (:domain warehouse-domain)

  (:objects
    robot1 robot2 - robot
    crate1 crate2 crate3 - crate
    loc10 loc20 - location
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
    
    ;; Crate 1 - heavy , 10 units away
    (crate-at crate1 loc10)
    (is-heavy crate1)
    (= (weight crate1) 70)
    
    ;; Crate 2 - Group A, fragile light , 20 units away
    (crate-at crate2 loc20)
    (is-fragile crate2)
    (= (weight crate2) 20)
    (crate-group crate2 groupA)

    ;; Crate 3 - Group A, light , 20 units away
    (crate-at crate3 loc20)
    (= (weight crate3) 20)
    (crate-group crate3 groupA)
    
    ;; Distance values (for distance-between function)
    (= (distance-between loc10 loading-bay) 10)
    (= (distance-between loading-bay loc10) 10)
    (= (distance-between loc20 loading-bay) 20)
    (= (distance-between loading-bay loc20) 20)

    ;; Recharge station
    (is-loading-bay loading-bay)
    (recharge-station loading-bay)
    
    ;; Group ordering
    (group-next crate1 crate2)
    (group-next crate2 crate3)

  )

  (:goal
    (and
      (crate-loaded crate1)
      (crate-loaded crate2)
      (crate-loaded crate3)
    )
  )
  (:metric minimize (total-time))
)
