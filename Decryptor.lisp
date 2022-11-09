(defvar dw)(defvar month2)(defvar day2)(defvar ee)

(defun decrypt (char) 
    (code-char (+ (- (- (char-code char) dw) month2) day2))
)

(defun decrypt-string (string) (map 'string #'decrypt string))

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
