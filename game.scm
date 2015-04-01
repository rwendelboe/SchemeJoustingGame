;The function prints the names of the opponents.  Than it calls joust function and the outcome is recorded.
;Finally it checks if the outcomes are equal if it is its recursively calling it self. If not it says who is the winner. 
(define (jousting-game knight1 knight2)
	(display "In the Battle are ")(display (caddr (knight1)))(display " and " ) (display (caddr (knight2)))
	(newline)
	(let (
			(outcome (joust knight1 knight2))
		)
		(cond
			((equal? (car outcome) (cadr outcome)) (jousting-game knight1 knight2))
			((equal? (car outcome) #t) 1)
			(else 2)
		)
	)
)
;The function calls the onHorse function passing it each knight and storing their results. 
;Than it checks if there was a time if not than it prints out the winner.
(define (joust player1 player2)
	(let* (
			(knight1 (player1))
			(knight2 (player2))
			(result1 (onHorse (car knight1)(cadr knight2)))
			(result2 (onHorse (car knight2)(cadr knight1)))
		)
		(cond
			((equal? result1 result2) (display "There was a tie!"))
			((equal? result1 #t) (display "The Winner is: ")(display (caddr knight1)))
			(else (display "The Winner is: ")(display (caddr knight2)))
		)
		(newline)
		(list result1 result2)
	)
)
;The function determines if someone has one and returns either #t or #f
(define (onHorse myShield theirLance)
	(cond
		((equal? myShield theirLance) #t)
		((and (equal? theirLance 'high)(equal? myShield 'duck)) #t)
		(else #f)
	)
)
