#lang racket
(define (make-accout balance password)
	(define (withdraw amount)
		(if (>= balance amount)
			(begin (set! balance (- balance amount))
				balance)
			"Insufficient funds"))
	(define (deposit amount)
		(set! balance (+ balance amount))
		balance)
	(define (error-msg arg)
		"Incorrect Password")
	(define (dispatch input-pass m)
		(if (eq? input-pass password)
			(begin 
				(cond 
					((eq? m 'withdraw) withdraw)
					((eq? m 'deposit) deposit)
					(else (error "Unknown request" m))))
			error-msg))
	dispatch)

;Usage:
(define acc (make-accout 100 'admin))

((acc 'admin 'withdraw) 50)
;50
((acc 'root 'deposit) 50)
;"Incorrect Password"
((acc 'admin 'withdraw1) 20)
;Unknown request withdraw1