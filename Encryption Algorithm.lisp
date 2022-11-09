(defvar access_code "Ready Access Key")
(defvar day 8)
(defvar month 11)
(defvar day-of-week 2)

; Obf char code
(defun next-codepoint (char) 
    (code-char (+ (+ (- (char-code char) day) month) day-of-week))
)

; Turn string into ASCII code
(defun nextify-string (string) (map 'string #'next-codepoint string))

; Adjustable string array https://stackoverflow.com/questions/18045842/appending-character-to-string-in-common-lisp
(defun make-adjustable-string (s)
               (make-array (length s) :fill-pointer (length s) :adjustable t :initial-contents s :element-type (array-element-type s)))

(defvar a (make-adjustable-string ""))

(loop for h from 1 to 75
    do (vector-push-extend (code-char h) a)
)
(print a)
(print (vector-pop a))
(print (char-code (vector-pop a)))
(print (char-code (vector-pop a)))
(print (char-code (vector-pop a)))
(defvar k (random 5))
(defvar l (random 6))
(defvar p (random 9))
