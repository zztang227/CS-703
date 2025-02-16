(set-logic QF_UF)

; Declare boolean constants for each node-color assignment
(declare-const p00 Bool)
(declare-const p01 Bool)
(declare-const p02 Bool)
(declare-const p10 Bool)
(declare-const p11 Bool)
(declare-const p12 Bool)
(declare-const p20 Bool)
(declare-const p21 Bool)
(declare-const p22 Bool)
(declare-const p30 Bool)
(declare-const p31 Bool)
(declare-const p32 Bool)

; Each node must have exactly one color (DNF form)
(assert (or (and p00 (not p01) (not p02)) 
            (and (not p00) p01 (not p02)) 
            (and (not p00) (not p01) p02)))

(assert (or (and p10 (not p11) (not p12)) 
            (and (not p10) p11 (not p12)) 
            (and (not p10) (not p11) p12)))

(assert (or (and p20 (not p21) (not p22)) 
            (and (not p20) p21 (not p22)) 
            (and (not p20) (not p21) p22)))

(assert (or (and p30 (not p31) (not p32)) 
            (and (not p30) p31 (not p32)) 
            (and (not p30) (not p31) p32)))

; Adjacent nodes must not have the same color
(assert (not (and p00 p10)))
(assert (not (and p00 p20)))
(assert (not (and p00 p30)))
(assert (not (and p10 p20)))
(assert (not (and p10 p30)))
(assert (not (and p20 p30)))

(assert (not (and p01 p11)))
(assert (not (and p01 p21)))
(assert (not (and p01 p31)))
(assert (not (and p11 p21)))
(assert (not (and p11 p31)))
(assert (not (and p21 p31)))

(assert (not (and p02 p12)))
(assert (not (and p02 p22)))
(assert (not (and p02 p32)))
(assert (not (and p12 p22)))
(assert (not (and p12 p32)))
(assert (not (and p22 p32)))

; Check satisfiability
(check-sat)
