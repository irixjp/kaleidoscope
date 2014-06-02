#|
  This file is a part of kaleidoscope project.
  Copyright (c) 2014 @irix_jp
|#

#|
  Author: @irix_jp
|#

(in-package :cl-user)
(defpackage kaleidoscope-asd
  (:use :cl :asdf))
(in-package :kaleidoscope-asd)

(defsystem kaleidoscope
  :version "0.1"
  :author "Tomoaki Nakajima"
  :license ""
  :depends-on (:bordeaux-threads
               :cl-annot
               :cl-ppcre
               :trivial-shell
               :local-time
               :alexandria
               :split-sequence)
  :components ((:module "src"
                :components
                ((:file "kaleidoscope"))))
  :description ""
  :long-description
  #.(with-open-file (stream (merge-pathnames
                             #p"README.markdown"
                             (or *load-pathname* *compile-file-pathname*))
                            :if-does-not-exist nil
                            :direction :input)
      (when stream
        (let ((seq (make-array (file-length stream)
                               :element-type 'character
                               :fill-pointer t)))
          (setf (fill-pointer seq) (read-sequence seq stream))
          seq)))
  :in-order-to ((test-op (test-op kaleidoscope-test))))
