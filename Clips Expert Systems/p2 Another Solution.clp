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
	(assert (color ?colorInput))
)