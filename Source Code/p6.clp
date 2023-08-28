; problem 6
(deftemplate person
	(multislot fullname
    (type STRING)
	)
	(multislot children
	(type STRING)
	)
)

(assert
	(person (fullname "Khaled Ashraf") (children "W" "S" "H" ))
	(person (fullname "Samah Moustafa") (children "B" "C" "D" "C"))
	(person (fullname "Hassan") (children "X" "C" "D" "S" "N"))
	(person (fullname "Youssef") (children "Y" "C" "D" "E"))
	(person (fullname "Mohamed") (children "Z" "C" "D" "Y" "D" "Y"))
)

(assert 
	(child-name "S")
)

(defrule printGreater3	
	(person (fullname ?n)(children $?c))
	(test (> (length$ $?c) 3))
=>
	(printout t ?n " have children greater than 3" crlf)
)


(defrule printParentOfChild
	(child-name ?cName)
	(person (fullname ?n)(children $?c))
	(test (member$ ?cName $?c))
=>
	(printout t "parent of " ?cName " is " ?n crlf)
)
; ------------------------------------------------------------------------------