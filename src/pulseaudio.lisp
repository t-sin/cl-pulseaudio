(defpackage #:pulseaudio
  (:use #:cl
        #:pulseaudio.cffi
        #:pulseaudio.keyword)
  (:export #:*available-sample-formats*
           #:raw-sample-format
           #:open-simple-stream
           #:with-audio-stream))
(in-package #:pulseaudio)

(defun open-simple-stream (appname direction
                           &key device description
                                sample-format rate channels
                                channel-map buffer-attributes ignore-errors)
  (let ((sample-format (raw-sample-format sample-format))
        ;; TODO: convert to cffi keywords
        (sample-spec nil)
        (device nil)
        (channel-map nil)
        (buffer-attributes nil)
        (ignore-errors nil))
    (pa-simple-new nil appname direction device description
                   sample-spec channel-map buffer-attributes ignore-errors)))

(defmacro with-audio-stream ((stream &key (appname "cl-pulseaudio app")
                                          (direction :output)
                                          (device nil)
                                          (description "cl-pulseudio stream")
                                          (sample-format nil)
                                          (rate 44100)
                                          (channels 2)
                                          (channel-map nil)
                                          (buffer-attributes nil)
                                          (ignore-errors nil))
                             &body body)
  `(let ((,stream (open-simple-stream ,appname ,direction
                                      :device ,device
                                      :description ,description
                                      :sample-format ,sample-format
                                      :rate ,rate
                                      :channels ,channels
                                      :channel-map ,channel-map
                                      :buffer-attributes ,buffer-attributes
                                      :ignore-errors ,ignore-errors)))
     (unwind-protect
          (progn ,@body)
       (unless (cffi:null-pointer-p ,stream)
         (pa-simple-free ,stream)))))
