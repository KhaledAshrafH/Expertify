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
