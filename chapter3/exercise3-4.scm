#lang racket
(define (make-accout balance password)
	(define incorrect-count 0)
	(define (withdraw amount)
		(if (>= balance amount)
			(begin (set! balance (- balance amount))
				balance)
			"Insufficient funds"))
	(define (deposit amount)
		(set! balance (+ balance amount))
		balance)
	(define (call-the-cops arg)
		"Calling the cops")
	(define (error-msg arg)
		"Incorrect Password")
	(define (dispatch input-pass m)
		(if (eq? input-pass password)
			(begin 
				(cond 
					((eq? m 'withdraw) withdraw)
					((eq? m 'deposit) deposit)
					(else (error "Unknown request" m))))
			(begin
				(if (eq? incorrect-count 7)
					(begin 
						(set! incorrect-count 0)
						call-the-cops)
					(begin 
						(set! incorrect-count (+ incorrect-count 1))
						error-msg)
				))))
	dispatch)

;Usage:
(define acc (make-accout 100 'admin))

((acc 'admin 'withdraw) 50)
;50
((acc 'root 'deposit) 50)
;"Incorrect Password"
((acc 'root 'deposit) 50)
((acc 'root 'deposit) 50)
((acc 'root 'deposit) 50)
((acc 'root 'deposit) 50)
((acc 'root 'deposit) 50)
((acc 'root 'deposit) 50)
((acc 'root 'deposit) 50)
((acc 'root 'deposit) 50)
