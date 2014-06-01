#|
  This file is a part of kaleidoscope project.
  Copyright (c) 2014 Tomoaki Nakajima (powered.by.solaris@gmail.com)
|#

(in-package :cl-user)
(defpackage kaleidoscope-test
  (:use :cl
        :kaleidoscope
        :cl-test-more))
(in-package :kaleidoscope-test)

;; NOTE: To run this test file, execute `(asdf:test-system :kaleidoscope)' in your Lisp.

(plan nil)

;; blah blah blah.

(finalize)
