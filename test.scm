(load "C:\\Users\\romanwendelboe\\Desktop\\JoustFiles\\knights.scm") ; You may need full paths to your files here
(load "C:\\Users\\romanwendelboe\\Desktop\\JoustFiles\\game.scm")
;(load "C:\\Users\\romanwendelboe\\Desktop\\JoustFiles\\test.scm")
(load "C:\\Users\\romanwendelboe\\Desktop\\JoustFiles\\tournament.scm")

(display "----Playing a game----\n")
(jousting-game black-knight king-arthur)
(display "----Playing a tournament----\n")
(tournament (list black-knight sir-robin king-arthur joan-of-arc roman-wendelboe))
(display "----Playing a season----\n")
(season 50 (list black-knight sir-robin king-arthur joan-of-arc roman-wendelboe))
