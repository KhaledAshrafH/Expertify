; problem 1

; The initial Facts in KB
(deffacts families
	(father Ahmed Mohammed)
	(father Hassan Ahmed)
	(father Ali Sara)
	(mother Mona Ali)
) 
; (reset) to save these facts


; The Rules
(defrule parent
	(or (mother ?a ?b) (father ?a ?b))
=>
	(assert(parent ?a ?b))
	(printout t "Fact Added" crlf)
)

(defrule grandmother
	(and (mother ?a ?b) (parent ?b ?c))
=>
	(assert(grandmother ?a ?c))
	(printout t "Fact Added" crlf)
)

(defrule grandfather
	(and (father ?a ?b) (parent ?b ?c))
=>
	(assert(grandfather ?a ?c))
	(printout t "Fact Added" crlf)
)

