(deftemplate Countries
	(slot Country) (multislot Flag-Color)
)

(deffacts cc
        (Countries (Country Egypt) (Flag-Color red white black))
		(Countries (Country United-States) (Flag-Color red white blue))
		(Countries (Country Belgium) (Flag-Color black yellow red))
		(Countries (Country Sweden) (Flag-Color yellow blue))
		(Countries (Country Italy) (Flag-Color green white red))
		(Countries (Country Ireland) (Flag-Color green white orange))
		(Countries (Country Greece) (Flag-Color blue white))
)

(defrule printCountries
	(color ?c)
	(Countries (Country ?cName) (Flag-Color $?colors))
	(test (member$ ?c $?colors))
=>
	(printout t ?cName " have color " ?c crlf)
)