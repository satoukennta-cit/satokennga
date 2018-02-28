(defun gpara ()
(defparameter ga ())
(defparameter new-ga ())
(defparameter invididual 10)
(defparameter point 5)
(defparameter gene-length 10)
(defparameter array-gene (make-array gene-length))
(defparameter array-gene2 (make-array gene-length))
(defparameter elite 3)
(defparameter cross-point 2)
(defparameter mutation-point 1)
)

(defun ga1 (number gene fitness)
(setf ga (push (list number gene fitness) ga)))

(defun sort-ga ()
(sort ga #'(lambda (x y) (> (nth 2 x) (nth 2 y)))))

(defun ga2 ()
(loop for n below invididual collect (progn (setf ga (push (car new-ga) ga)) (setf new-ga (cdr new-ga))))
ga)

(defun initial ()
(gpara)
(loop for n below gene-length collect (ga1 n (run-gene) n))
(eval-ga))


(defun run-gene1 (i)
(loop for n below i do (if (= n 0) (progn (initial) (format t "~s,~f,~f~%" n (nth 2 (nth 0 ga)) (nth 1 (nth 0 ga))))
(progn
(eval-ga)
(roulette-ga)
(mutation-ga)
(ga2)
(eval-ga)
(sort-ga)
(cut-ga)
(sort-ga)
(format t "~s,~f,~f~%" n (nth 2 (nth 0 ga)) (nth 1 (nth 0 ga)))))))

(defun genelen1 (ga)
(make-array gene-length :initial-contents ga))

(defun genelen2 (new-ga)
(make-array gene-length :initial-contents new-ga))

(defun run-gene ()
(genelen1 (loop for n below gene-length collect (setf (aref array-gene n) (random point)))))


(defun eval-ga ()
(loop for n below (length ga) collect (setf (nth 2 (nth n ga)) (eval-ga2 (nth 1 (nth n ga))))) ga)

(defun eval-ga2 (a)
(let ((x 0)) (loop for n below (length a) collect (setf x (+ x (aref a n))))
x))

(defun roulette-ga ()
(sort-ga)
(setf new-ga ())
(loop for n below (/ invididual 2) collect (crossover (select) (select)))) 

(defun mutation-ga ()
(loop for n below (length ga) collect (mutation (nth 1 (nth n ga)))))

(defun select (&optional (n 0) (x 3) (h 0))
(let ((y 10))
(if (= h invididual) (select 0 3 0)
(progn (if (> x (random y)) n
(select (+ 1 n) 3 (+ 1 h)))))))


(defun elite-copy () 
(setf elite-copy-ga ())
(loop for n below elite collect (setf elite-copy-ga  (push (nth n ga) elite-copy-ga))) elite-copy-ga)

(defun mutation (a)
(let ((y 10) (c 0))                                                         
(loop for n below gene-length collect (if (> mutation-point (random y))
(setf (aref a n) (random point))))))
      
(defun crossover (a b)
(let ((y 10) (c 0) (d 0))
(loop for n below gene-length collect (if (> cross-point (random y))
(progn (setf c (aref (nth 1 (nth a ga)) n))
       (setf d (aref (nth 1 (nth b ga)) n))
       (setf (aref array-gene n) d)
       (setf (aref array-gene2 n) c))
(progn (setf (aref array-gene n) (aref (nth 1 (nth a ga)) n))
       (setf (aref array-gene2 n) (aref (nth 1 (nth b ga)) n))))))
(setf new-ga (push (list 0 (genelen2 array-gene) 0) new-ga))
(setf new-ga (push (list 0 (genelen2 array-gene2) 0) new-ga)))

(defun cut-ga () (let ((y ()))
(loop for n below invididual collect (progn (setf y (push (car ga) y)) (setf ga (cdr ga)))) (setf ga y)))




