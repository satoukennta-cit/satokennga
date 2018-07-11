#|
MIT License

Copyright (c) 2018 satou kenta

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.
|#

(declaim (optimize (speed 3) (debug 0) (safety 0) (compilation-speed 0) (space 0)))


(ql:quickload :clgplot)

(defun gpara ()
(defparameter ga ())
(defparameter new-ga ())
(defparameter invididual 300)
(defparameter point 51)
(defparameter gene-length 1000)
(defparameter initial-invididual-space (make-array gene-length :initial-element 0))
(defparameter elite 1)
(defparameter elite-goodness 0)
(defparameter elite-goodness2 0)
(defparameter elite-array ())
(defparameter cross-point2 2)
(defparameter cross-point 5)
(defparameter mutation-point 1)
)
      
(defun ga1 (number gene fitness)
(setf ga (push (list number gene fitness) ga)))

(defun sort-ga ()
(let ((mm ga))
(setf ga (sort mm #'(lambda (xyz yzx) (> (nth 2 xyz) (nth 2 yzx)))))))

(defun ga2 ()
(loop for n below invididual do (progn (setf ga (push (car new-ga) ga)) (setf new-ga (cdr new-ga))))
new-ga)

(defun selection-ga2 ()
(setf ga new-ga)
(setf new-ga ()))


(defun initial ()
(gpara)
(loop for n below invididual do (ga1 n (run-gene) n))
(eval-ga)
(sort-ga))

(defun cut-ga () (let ((y ()))
(loop for n from (1- invididual) downto 0 do (setf y (push (nth n ga) y))) (setf ga y)))

(defun select-roulette ()
(let ((select-count 0) (select1 0) (select2 0) (cross cross-point2))
(labels ((select ()
(loop while (< cross (random 10)) do
(progn (setq select-count (+ 1 select-count)) (if (= select-count invididual) (setf select-count 0)))) select-count))
(setq select1 (select))
(loop while (equalp select1 select2) do (setq select2 (select))) (values select1 select2))))

(defun run-gene1 (i)
(let ((ga-plot-array (make-array i :adjustable T :fill-pointer 0))
)
(loop for n below i do (if (= n 0) (progn (initial) (format t "~s,~f,~f~%" (+ n 1) (nth 2 (nth 0 ga)) (nth 1 (nth 0 ga))))
(progn
(vector-push (nth 2 (nth 0 ga)) ga-plot-array)
(elite-copy)
(roulette-ga)
(mutation-ga)
(selection-ga2)
(eval-ga)
(sort-ga)
(elite-set)
(format t "~s,~f,~f~%" (+ n 1) (nth 2 (nth 0 ga)) (nth 1 (nth 0 ga))))) when (= n i) return (print 'end))
(clgp:plot ga-plot-array)))

(defun genelen1 (ga)
(make-array gene-length :initial-contents ga))

(defun genelen2 (new-ga)
(make-array gene-length :initial-contents new-ga))

(defun run-gene ()
(genelen1 (loop for n below gene-length collect (setf (aref initial-invididual-space n) (random point)))))

(defun eval-ga ()
(loop for n below invididual do (setf (nth 2 (nth n ga)) (eval-ga2 (nth 1 (nth n ga))))) ga)

(defun eval-ga2 (a)
(let ((x 0)) (loop for n below (length a) do (setf x (+ x (aref a n))))
x))

(defun roulette-ga ()
(loop repeat (/ invididual 2) do (crossover))
)  

(defun mutation-ga ()
(loop for n below (length ga) do (mutation (nth 1 (nth n new-ga)))))

(defun elite-copy-ga ()
(if (> (nth 2 (nth 0 ga)) elite-goodness)
(setq elite-goodness2 (nth 2 (nth 0 ga)))))

(defun elite-set ()
(if (>= elite-goodness2 elite-goodness)
(progn 
(loop for n from (- elite 1) downto 0  do (setf ga (push (nth n elite-array) ga)))
(setq elite-goodness elite-goodness2)
(cut-ga)
(sort-ga))))

(defun elite-copy ()
(if (elite-copy-ga)
(progn (setq elite-array ())
(loop for n from (- elite 1) downto 0 do (setf elite-array (push (nth n ga) elite-array))))))

(defun mutation (a)
(let ((y 10))                                                         
(loop for n below gene-length do (if (> mutation-point (random y))
(setf (aref a n) (random point))))))

(defun crossover ()
(multiple-value-bind (aa bb) (select-roulette)
(let ((y 10)
(array-gene (make-array gene-length :initial-element 0))
(array-gene2 (make-array gene-length :initial-element 0)))
(loop for s below gene-length do (if (> cross-point (random y))
(progn (setf (aref array-gene s) (aref (nth 1 (nth aa ga)) s))
       (setf (aref array-gene2 s) (aref (nth 1 (nth bb ga)) s)))
(progn (setf (aref array-gene s) (aref (nth 1 (nth bb ga)) s))
       (setf (aref array-gene2 s) (aref (nth 1 (nth aa ga)) s)))))
       (setf new-ga (push (list 0 array-gene 0) new-ga))
(setf new-ga (push (list 0 array-gene2 0) new-ga)))))   
