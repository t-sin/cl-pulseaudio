#-asdf
(require :asdf)
#.(progn
    #+quicklisp
    (ql:quickload :trivial-features :silent t)
    #-quicklisp
    (asdf:load-system :trivial-features :verbose nil)
    t)

(eval-when (:compile-toplevel :load-toplevel :execute)
  #+quicklisp
  (ql:quickload :cffi-grovel :silent t)
  #-quicklisp
  (asdf:load-system :cffi-grovel :verbose nil))

(in-package :cl-user)

(defpackage cl-pulseaudio-asd
  (:use :cl :asdf))
(in-package :cl-pulseaudio-asd)

(defsystem cl-pulseaudio
  :description "pulse audio binding."
  :author "SANO Masatoshi"
  :version "0.0.1"
  :license "LLGPL"
  :defsystem-depends-on (:cffi-grovel)
  :depends-on (:cffi
               :cffi-grovel
               :osicat)
  :components ((:module "src"
                :components
                ((:file "init")
                 (cffi-grovel:grovel-file "grovel")
                 (:file "simple")
                 (:file "error"))))
  :serial t)
