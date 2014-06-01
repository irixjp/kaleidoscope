#|
  This file is a part of kaleidoscope project.
  Copyright (c) 2014 Tomoaki Nakajima (powered.by.solaris@gmail.com)
|#

(in-package :cl-user)
(defpackage kaleidoscope-test-asd
  (:use :cl :asdf))
(in-package :kaleidoscope-test-asd)

(defsystem kaleidoscope-test
  :author "Tomoaki Nakajima"
  :license ""
  :depends-on (:kaleidoscope
               :cl-test-more)
  :components ((:module "t"
                :components
                ((:test-file "kaleidoscope"))))

  :defsystem-depends-on (:cl-test-more)
  :perform (test-op :after (op c)
                    (funcall (intern #. (string :run-test-system) :cl-test-more)
                             c)
                    (asdf:clear-system c)))
