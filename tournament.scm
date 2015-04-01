;The function returns the index of the winner. it simulates a tournament by calling playTournament which than returns who won and displays them along with their index
(define (tournament knightsList)
	(if (equal? (length knightsList) 1)
		1
		(let(
				(champion (playTournament knightsList '()))
			)	
			(display "The Tournament Champion is: ")(display (caddr (champion)))
			(newline)
			(newline)
			(getKnightIndex champion knightsList)
		)	
	)
)

;function simulates a season by calling a recursive function playSeason to decrement the number of tournaments and to store the result  
(define (season numTournaments knightsList)
	(let (
			(result (playSeason  numTournaments (createList (length knightsList)) knightsList))
		)
		(display "The Result of the Season are: ")(display result)
		(newline)
	)
)

;The function decrements the tournament number and increases the index of the winner and keeps recursively calling it self.
(define (playSeason numTournaments resultList knightsList)
	(if (= numTournaments 0)
		resultList
		(let* (
				(newResultList (incrementIndex resultList (tournament knightsList)))
			)
			(playSeason (- numTournaments 1) newResultList knightsList)
		)
	)
)

;function takes a list and increments the index in that list by one.
(define (incrementIndex knightsList index)
	(if (= index 1)
		(let( 
				(toIncrement  (car knightsList))
			)
			(cons (+ toIncrement 1) (cdr knightsList))
		)
		(cons (car knightsList)(incrementIndex (cdr knightsList)(- index 1)))
	)
)

;takes a number and returns a list of zeros that length 
(define (createList numOfKnights)
	(if(<= numOfKnights 1)
		(cons 0 '())
		(cons 0 (createList (- numOfKnights 1)))
	)
)

;function jousts between the first two people in the list than if there is a winner he gets stored in a list and if there isn't a winner they get stored in a list too.
(define (playRound knightsList)
	(cond
		((null? knightsList) (list '() '()))
		((equal? (length knightsList) 1) (list knightsList '()))
		(else
			(let* (
					(joustResult (jousting-game (car knightsList)(cadr knightsList)))
					(nextResult (playRound (cddr knightsList)))
				)
				(if (= joustResult 1)
					(list (cons (car knightsList)(car nextResult)) (cons (cadr knightsList)(cadr nextResult)))
					(list (cons (cadr knightsList)(car nextResult)) (cons (car knightsList)(cadr nextResult)))
				)
			)
		)
	)
)

;The function calls the playRound function with winners and losers till only one of each is left.  Than they joust between each other to find a winner.
(define (playTournament winnersList losersList)
	(listThe winnersList losersList)
	(newline)
	(if (and (equal? (length winnersList) 1)(equal? (length losersList) 1))
		(cond
			((equal? (jousting-game (car winnersList) (car losersList)) 1) (car winnersList))
			(else (car losersList))
		);if one of each left than joust between them
		;else store the result and call play round
		(let*(
				(winnersTwoSublists (playRound winnersList))
				(roundWinners (car winnersTwoSublists))
				(roundLosers (cadr winnersTwoSublists))
				(losersTwoSublists(playRound losersList))
				(winnersOfLosers (car losersTwoSublists))
			)
			(playTournament roundWinners (append winnersOfLosers roundLosers))
		)
	)
)

;the function gives a visual of who is in the losers and winners lists during the tournament 
(define (listThe winnersList losersList)
	(display "The Winners Are : ")
		(map (
				lambda (showWinnigKnight) (display (caddr (showWinnigKnight)))(display ", ")
			)
			winnersList
		)
	(display "    The Losers Are: ")
		(map (
				lambda (showLosingKnight) (display (caddr (showLosingKnight)))(display ", ")
			) 
			losersList
		)
	(newline)
)

;The function returns the index of the knight in a list
(define (getKnightIndex knight knightsList)
	(if (null? knightsList) 
	    -1
	    (if (equal? knight (car knightsList))
			1
			(+ 1 (getKnightIndex knight (cdr knightsList)))
		)
	)
)
