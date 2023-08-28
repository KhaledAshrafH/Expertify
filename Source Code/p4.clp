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