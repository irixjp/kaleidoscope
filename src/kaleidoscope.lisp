#|
  This file is a part of kaleidoscope project.
  Copyright (c) 2014 Tomoaki Nakajima (powered.by.solaris@gmail.com)
|#

(in-package :cl-user)
(defpackage kaleidoscope
  (:use :cl))
(in-package :kaleidoscope)

(annot:enable-annot-syntax)

(defclass role ()
  ((hosts :accessor role-hosts :initform '("localhost") :initarg :hosts)
   (port  :accessor role-port  :initform "22"           :initarg :port)
   (user  :accessor role-user  :initform "root"         :initarg :user)
   (key   :accessor role-key   :initform nil            :initarg :key)))

(defgeneric run-ssh (role command)
  (:documentation   "This is a generic function.
It run commnad via ssh with Role object.
Retrun a list of thread objects."))

(defmethod run-ssh ((obj role) command)
  (let ((key (if (role-key obj)
                 (concatenate 'string "-i " (role-key obj) " ")
                 "")))
    (loop for host in (role-hosts obj)
         collect (make-thread-and-run
                  (concatenate 'string
                               "ssh -l "
                               (role-user obj) " "
                               key
                               host " "
                               command)))))

(defun make-thread-and-run (command)
  (format t "~s~%" command)
  (bordeaux-threads:make-thread #'(lambda ()
                                    (trivial-shell:shell-command command))))
