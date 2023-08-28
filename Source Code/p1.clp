; problem 1

; Templates
(deftemplate Father 
	(slot Name)
	(slot Childname)
)

(deftemplate Mother 
	(slot Name)
	(slot Childname)
)


; The initial Facts in KB
(assert 
	(Father(Name "Ahmed")
	(Childname "Mohammed"))
) 

(assert 
	(Father (Name "Ali")
	(Childname "Sara"))
) 

(assert 
	(Father(Name "Hassan")
	(Childname "Ahmed"))
) 

(assert 
	(Mother (Name "Mona")
	(Childname "Ali"))
) 

;The Rules
(defrule Parent
	(or(Father (Name ?name) (Childname ?childname))(Mother (Name ?name) (Childname ?childname))) 
=> 
	(assert (parent ?name ?childname))
)

(defrule Grandfather
	(Father (Name ?name) (Childname ?childname))
	(parent ?childname ?grandchild)
=>
	(assert (Grandfather ?name ?grandchild))
)

(defrule Grandmother
	(Mother (Name ?name) (Childname ?childname))
	(parent ?childname ?grandchild)
=>
	(assert (Grandmother ?name ?grandchild))
)