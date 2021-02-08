(defpackage #:pulseaudio
  (:use #:cl
        #:pulseaudio.cffi)
  (:export #:with-audio-stream))
(in-package #:pulseaudio)

(defmacro with-audio-stream ((stream appname (&key (direction :output)
                                                   (device nil)
                                                   (description "cl-pulseudio stream")
                                                   (sample-spec nil)
                                                   (channel-map nil)
                                                   (buffer-attributes nil)
                                                   (ignore-errors nil)))
                             &body body)
  `(let ((,stream (pa-simple-new nil appname
                                 direction device description
                                 sample-format channel-map buffer-attributes ignore-errors)))
     (unwind-protect
          (progn ,@body)
       (unless (cffi:null-pointer-p ,stream)
         (pa-simple-free ,stream)))))
