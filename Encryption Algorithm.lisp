(defvar access_code "Ready Access Key")
(defvar day 9)
(defvar month 11)
(defvar day-of-week 3)
(defvar d)(defvar m)(defvar dw)
(defvar real-day)(defvar real-month)(defvar real-day-of-week)

(multiple-value-bind
	(c v m q r p dax Ill IlI)
	(get-decoded-time)
    (setf real-day q)
    (setf real-month r)
    (setf real-day-of-week dax)
    )

; Obf char code
(defun next-codepoint (char) 
    (code-char (+ (+ (- (char-code char) day) month) day-of-week))
)

(defun decrypt (char) 
    (code-char (+ (- (- (char-code char) dw) month2) day2))
)

; Turn string into ASCII code
(defun nextify-string (string) (map 'string #'next-codepoint string))
(defun decrypt-string (string) (map 'string #'decrypt string))

; Adjustable string array https://stackoverflow.com/questions/18045842/appending-character-to-string-in-common-lisp
(defun make-adjustable-string (s)
               (make-array (length s) :fill-pointer (length s) :adjustable t :initial-contents s :element-type (array-element-type s)))

(defvar a (make-adjustable-string ""))

(defvar b '(day month year))
(defvar i 0)
(loop for h from 1 to 15
    do (if (equal h 5)
           (vector-push-extend (code-char (+ day 32)) a)
           (if (equal h 10)
               (vector-push-extend (code-char (+ month 32)) a)
               (if (equal h 14)
                   (vector-push-extend (code-char (+ day-of-week 32)) a)
                   (vector-push-extend (code-char (+ h 32)) a)
               )
           )
    )
)

(defun decryptor (encryption_key encryption_access)
    (setf ee (coerce encryption_key 'list))(setf access (coerce encryption_access 'list))
    (setf day2 (char-code (code-char (- (char-code (nth 4 ee)) 32))))
    (setf month2 (char-code (code-char (- (char-code (nth 9 ee)) 32))))
    (setf dw (char-code (code-char (- (char-code (nth 13 ee)) 32))))
    (if (or (< (- day2 real-day) -1)(< (- month2 real-month) -1))
        (return-from decryptor nil)
        (print (decrypt-string encryption_access))
    )
)

(setf encryption_access (nextify-string access_code))
(setf encryption_key a)
(setf a (coerce a 'list))
(print encryption_access)
(print encryption_key)
(decryptor encryption_key encryption_access)
