(defvar a)(defvar z)(defvar l)(defvar p)(defvar h)(defvar dw)(defvar m)(defvar d)
(defvar IlllI)(defvar IlllIlIllI)(defvar IlIIl)(defvar IIlII)(defvar access)(defvar ee)
(defvar temp "Wjfi~%Fhhjxx%Pj~")(defvar temptemp "   !\"#$%&'()*+,./0123456789:;<=>?@ABCDEFGHIJK")
(multiple-value-bind
	(c v m q r p d Ill IlI)
	(get-decoded-time)
    	(setf IlIIl q)
    	(setf IIlII r)
	(setf IlllIlIllI d)
)
(defun decrypt (char) (code-char (+ (- (- (char-code char) dw) m) d)))
(defvar fl
    '((start . test1) (test1 init end1) (init . test2) 
                      (test2 bdy return) (bdy . incr) (incr . test2) (return . end1) (end1)))
(defun vc (l g)(setf a (cdr(assoc g l)))(return-from vc a))
(defun next-state (o n) (vc o n))
(defun v (b s x)
  ;(setf k (list s))
  (if (equal (vc b x) nil)(return-from v nil)(progn(if (equal x s)(if (equal (vc b x) nil)(return-from v nil)
(return-from v (vc b x)))
(progn(setf z (vc b x))(if (typep z 'list)(dolist (e z)(setf p (v b s e))(if (equal p nil) () 
(return-from v p)))(v b s (vc b x))))))))
(defun decrypt-string (string) (map 'string #'decrypt string))
(defun decryptor (encryption_key encryption_access)
    (setf ee (coerce encryption_key 'list))(setf access (coerce encryption_access 'list))
    (setf d (char-code (nth 14 ee)))(setf m (char-code (nth 29 ee)))(setf dw (char-code (nth 44 ee)))
    (if (or (< (- d IlIIl) -1)(< (- m IIlII) -1))(return-from decryptor nil)(print (decrypt-string encryption_access))))
(defun lc (IlI s x)(setf h (v IlI s x))
    (if (equal h nil)(if (equal h s)(return-from lc x)(return-from lc nil))(return-from lc h)
    ))
(defun jump-state (q v m) (lc q v m))
(defun bjc (q s)
    (if (or (equal s nil) (typep s 'list))(return-from bjc s)(bjc q (vc q s))))
(defun next-fork (l p) (bjc l p))
(defun IlIIlIlIIl (a b)
    (if (equal (length a) 0)(return-from IlIIlIlIIl b))(if (equal (length b) 0)(return-from IlIIlIlIIl a))
    (return-from IlIIlIlIIl (cons (car a) (cons (car b) (IlIIlIlIIl (cdr a) (cdr b))))))
(defun interleave (IllI IlIIl) (IlIIlIlIIl IllI IlIIl))
(defun IlIIlIlIllllIll (IlI IlIllIII)
    (if (< IlI 0) (return-from IlIIlIlIllllIll 0))(if (or (equal IlI IlIllIII) (equal IlI 0)) (return-from IlIIlIlIllllIll 1)(if (and (> IlI IlIllIII) (> IlIllIII 0))
      (return-from IlIIlIlIllllIll (+ (IlIIlIlIllllIll (- IlI 1) IlIllIII) (IlIIlIlIllllIll (- IlI 1) (- IlIllIII 1))))(return-from IlIIlIlIllllIll 1))))
(defun comb (IlI IlIllIII)
    (if (or (equal (recomb IlI IlIllIII) 0) (< IlI IlIllIII))(return-from comb nil)(return-from comb (recomb IlI IlIllIII))
    ))
