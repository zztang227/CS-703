(set-logic QF_LRA)

;; Declare real variables for the left and right endpoints of each interval
(declare-const l1 Real)
(declare-const r1 Real)
(declare-const l2 Real)
(declare-const r2 Real)
(declare-const l3 Real)
(declare-const r3 Real)
(declare-const l4 Real)
(declare-const r4 Real)

;; Intervals must be valid (left endpoint < right endpoint)
(assert (< l1 r1))
(assert (< l2 r2))
(assert (< l3 r3))
(assert (< l4 r4))

;; Define intersection conditions
(define-fun intersects ((lA Real) (rA Real) (lB Real) (rB Real)) Bool
  (and (< lA rB) (< lB rA)))

;; C4 adjacency constraints:
(assert (intersects l1 r1 l2 r2))  ;; Edge (1,2)
(assert (intersects l2 r2 l3 r3))  ;; Edge (2,3)
(assert (intersects l3 r3 l4 r4))  ;; Edge (3,4)
(assert (intersects l4 r4 l1 r1))  ;; Edge (4,1)

;; Non-adjacency constraints (these pairs must not intersect):
(assert (not (intersects l1 r1 l3 r3))) ;; No edge (1,3)
(assert (not (intersects l2 r2 l4 r4))) ;; No edge (2,4)

;; Check satisfiability
(check-sat)
