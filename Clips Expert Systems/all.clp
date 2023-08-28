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
; ------------------------------------------------------------------------------

; problem 2

(deftemplate Countries
	(slot Country) (multislot Flag-Color)
)

(assert (Countries (Country Egypt) (Flag-Color red white black))
		(Countries (Country United-States) (Flag-Color red white blue))
		(Countries (Country Belgium) (Flag-Color black yellow red))
		(Countries (Country Sweden) (Flag-Color yellow blue))
		(Countries (Country Italy) (Flag-Color green white red))
		(Countries (Country Ireland) (Flag-Color green white orange))
		(Countries (Country Greece) (Flag-Color blue white))
)

(deffunction readColor()
	(bind ?colorInput (read))
	(assert
		(color ?colorInput)
	)
)


(defrule printCountries
	(color ?c)
	(Countries (Country ?cName) (Flag-Color $?colors))
	(test (member$ ?c $?colors))
=>
	(printout t ?cName " have color " ?c crlf)
)
; ------------------------------------------------------------------------------



; problem 3

(deffunction calcGPA()
	(open "D://My Home//Courses//#My Faculty//Fourth Level//First Semester//Semantic Web//Assignments//Assignment 1//A1//input.txt" myData "r")
	(open "D://My Home//Courses//#My Faculty//Fourth Level//First Semester//Semantic Web//Assignments//Assignment 1//A1//output.txt" myOutput "w")
	(bind ?name (read myData))
    (while (neq ?name EOF)
		(bind ?x1 (read myData)) (bind ?x1 (integer ?x1))
		(bind ?x2 (read myData)) (bind ?x2 (integer ?x2))
		(bind ?x3 (read myData)) (bind ?x3 (integer ?x3))
		(bind ?x4 (read myData)) (bind ?x4 (integer ?x4))
		(printout myOutput ?name " ("?x1" " ?x2 " "?x3 " " ?x4 ") " (/ (+ ?x1 (+ ?x2 (+ ?x3 ?x4)))4) crlf)
        (bind ?name (read myData))
    )
	(close myData)
	(close myOutput)
)
; ------------------------------------------------------------------------------

; problem 4

(defclass Shape
(is-a USER)
(role concrete)
(slot ID (type SYMBOL))
(slot color (allowed-values red blue green yellow)))

(defclass Square (is-a Shape)(slot length)(slot area)(slot perimeter))
(defclass Rectangle (is-a Shape)(slot width)(slot length)(slot area)(slot perimeter))

(defmessage-handler Square calcArea()
	(bind ?area (send ?self get-area))
	(bind ?newArea (* (send ?self get-length) (send ?self get-length)))
	(send ?self put-area ?newArea))
)

(defmessage-handler Square calcPerimeter()
	(bind ?perimeter (send ?self get-perimeter))
	(bind ?newPerimeter (* (send ?self get-length) 4))
	(send ?self put-perimeter ?newPerimeter))
)


(defmessage-handler Rectangle calcArea()
	(bind ?area (send ?self get-area))
	(bind ?newArea (* (send ?self get-length) (send ?self get-width)))
	(send ?self put-area ?newArea))
)

(defmessage-handler Rectangle calcPerimeter()
	(bind ?perimeter (send ?self get-perimeter))
	(bind ?newPerimeter (* (+ (send ?self get-length) (send ?self get-width)) 2))
	(send ?self put-perimeter ?newPerimeter))
)
; ------------------------------------------------------------------------------


; problem 5
(deftemplate square (slot id) (slot side-length))
(deftemplate rectangle (slot id) (slot width) (slot height))
(deftemplate circle (slot id) (slot radius))


(defrule sumOfAreasAndPerimeters
=>
  (bind ?sum 0)
  (do-for-all-facts ((?s square)) TRUE
     (bind ?sum (+ ?sum (* ?s:side-length ?s:side-length)))
  )
  (do-for-all-facts ((?r rectangle)) TRUE
     (bind ?sum (+ ?sum (* ?r:width ?r:height)))
  )
  (do-for-all-facts ((?c circle)) TRUE
     (bind ?sum (+ ?sum (* (* ?c:radius ?c:radius) 3.14) ))
  )
  
  (printout t "Sum of Areas: " ?sum crlf)
  
  (bind ?sum 0)
  (do-for-all-facts ((?s square)) TRUE
     (bind ?sum (+ ?sum (* ?s:side-length 4)))
  )
  (do-for-all-facts ((?r rectangle)) TRUE
     (bind ?sum (+ ?sum (* (+ ?r:width ?r:height) 2)))
  )
  (do-for-all-facts ((?c circle)) TRUE
     (bind ?sum (+ ?sum (* (* ?c:radius 3.14) 2) ))
  )
  
  (printout t "Sum of Perimeters: " ?sum crlf)
)


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


; (deffacts test (square (id A) (side-length 3)) (square (id B) (side-length 5))
; (rectangle (id C) (width 2) (height 5)) (circle (id D) (radius 2)) (circle (id E) (radius 6)))




