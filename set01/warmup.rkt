;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname warmup) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ())))
(require rackunit)
(require "extras.rkt")
(require 2htdp/image)
(define TIME-ON-TASK 1.5)


; Q13
; distance : Number Number -> Number
; GIVEN: a value of x and a value of y that represents a coordinate
; RETURNS: the distance of the given coordinate from the origin
; STRATEGY: functional composition
; EXAMPLES: (distance 3 4) -> 5
(define (distance x y)
  (sqrt (+ (expt x 2)(expt y 2))))
; TESTS:
(begin-for-test
  (check-equal? (distance 3 4) 5))

;Q14
; cube-volume :  Number -> Number
; GIVEN: a value of the side of a cube
; RETURNS: the volume of the cube using the formula (side)^3
; STRATEGY: Function Composition
; EXAMPLES: (cube-volume 2) -> 8
(define (cube-volume x)
  (expt x 3))
; TESTS:
(begin-for-test
  (check-equal? (cube-volume 2) 8))

; cube-surface : Number -> Number
; GIVEN: a value of the side of a cube
; RETURNS: the total surface area of the cube using the formula 6*(side)^2
; STRATEGY: Function Composition
; EXAMPLES: (cube-surface 2) -> 24
(define (cube-surface x)
  (* 6 (expt x 2)))
; TESTS:
(begin-for-test
  (check-equal? (cube-surface 2) 24))

; Q15
; string-first : String -> String
; GIVEN: a string
; RETURNS: the first letter of the given string
; STRATEGY: Function Composition
; EXAMPLES: (string-first "abc") -> "a"
(define (string-first str)
  (string-ith str 0))
; TESTS:
(begin-for-test
  (check-equal? (string-first "abc") "a"))

; Q16
; string-last : String -> String
; GIVEN: a string
; RETURNS: the last letter of the given string
; STRATEGY: Function Composition
; EXAMPLES: (string-last "abc") -> "c"
(define (string-last str)
  (substring str (- (string-length str) 1)))
; TESTS:
(begin-for-test
  (check-equal? (string-last "abc") "c"))

; Q17
; bool-imply : Boolean Boolean -> Boolean
; GIVEN: two boolean values
; RETURNS: a boolean value depending on the given boolean values
; STRATEGY: Function Composition
; EXAMPLES: (bool-imply #f #t) -> #t
(define (bool-imply b1 b2)
  (if
   (and (boolean=? b1 #f)(boolean=? b2 #t))
   #t
   #f))
; TESTS:
(begin-for-test
  (check-equal? (bool-imply #f #t) #t)
  (check-equal? (bool-imply #f #f) #f))

; Q18
; image-area : Image -> Number
; GIVEN: an image
; RETURNS: the number of pixels covered by that image
; STRATEGY: Function Composition
; EXAMPLES: (image-area (bitmap "cat.png")) -> 8775
(define (image-area img)
  (* (image-width img)(image-height img)))
; TESTS:
(begin-for-test
  (check-equal? (image-area (bitmap "cat.png")) 8775))

; Q19
; image-classify : Image -> String
; GIVEN: an image
; RETURNS: a string depending on the comparison of the height and width of the 
; given image
; STRATEGY: Function Composition
; EXAMPLES; (image-classify (rectangle 10 10 "solid" "black")) -> "square"
(define (image-classify img)
  (if
   (> (image-height img)(image-width img))
   "tall"
   (if
    (< (image-height img)(image-width img))
    "wide"
    "square")))
; TESTS:
(begin-for-test
  (check-equal? (image-classify (rectangle 10 10 "solid" "black")) "square")
  (check-equal? (image-classify (rectangle 20 10 "solid" "black")) "wide")
  (check-equal? (image-classify (rectangle 5 10 "solid" "black")) "tall"))

; Q20
; string-join : String String -> String
; GIVEN: 2 strings
; RETURNS: a new string formed by joining the given 2 strings
; STRATEGY: Function Composition
; EXAMPLES: (string-join "aa" "bb") -> "aa_bb"
(define (string-join str1 str2)
  (string-append str1 "_" str2))
; TESTS:
(begin-for-test
  (check-equal? (string-join "aa" "bb") "aa_bb"))

; Q21
; string-insert : String Number -> String
; GIVEN: a string and a value for a position
; RETURNS: a new string with a "_" inserted at the given position
; EXAMPLES: (string-insert "abcd" 3) -> "ab_cd"
(define (string-insert str pos)
  (string-append
   (substring str 0 (- pos 1))
   "_"
   (substring str (- pos 1))))
; TESTS:
(begin-for-test
  (check-equal? (string-insert "abcd" 3) "ab_cd"))

; Q22
; string-delete : String Number -> String
; GIVEN: a string and a value for a position
; RETURNS: a new string with the character at the given position deleted
; EXAMPLES: (string-delete "abcd" 2) -> "acd"
(define (string-delete str pos)
  (string-append
   (substring str 0 (- pos 1))
   (substring str pos)))
; TESTS:
(begin-for-test
  (check-equal? (string-delete "abcd" 2) "acd"))