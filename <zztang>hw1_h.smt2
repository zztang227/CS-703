(set-logic QF_UF)
(set-option :produce-models true)  ; Enable model generation
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
(declare-const p40 Bool)
(declare-const p41 Bool)
(declare-const p42 Bool)

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

(assert (or (and p40 (not p41) (not p42)) 
            (and (not p40) p41 (not p42)) 
            (and (not p40) (not p41) p42)))

; Adjacent nodes must not have the same color
(assert (not (and p00 p10)))  ; Edge (0,1)
(assert (not (and p00 p20)))  ; Edge (0,2)
(assert (not (and p10 p20)))  ; Edge (1,2)
(assert (not (and p10 p30)))  ; Edge (1,3)
(assert (not (and p10 p40)))  ; Edge (1,4)
(assert (not (and p20 p30)))  ; Edge (2,3)
(assert (not (and p20 p40)))  ; Edge (2,4)

(assert (not (and p01 p11)))
(assert (not (and p01 p21)))
(assert (not (and p11 p21)))
(assert (not (and p11 p31)))
(assert (not (and p11 p41)))
(assert (not (and p21 p31)))
(assert (not (and p21 p41)))

(assert (not (and p02 p12)))
(assert (not (and p02 p22)))
(assert (not (and p12 p22)))
(assert (not (and p12 p32)))
(assert (not (and p12 p42)))
(assert (not (and p22 p32)))
(assert (not (and p22 p42)))

; Check satisfiability
(check-sat)

; If satisfiable, return a model
(get-model)
