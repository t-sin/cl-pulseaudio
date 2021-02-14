(defpackage #:pulseaudio
  (:use #:cl
        #:pulseaudio.cffi
        #:pulseaudio.keyword)
  (:export #:*available-sample-formats*
           #:raw-sample-format
           #:raw-direction
           #:open-stream
           #:close-stream
           #:write-stream
           #:with-audio-stream))
(in-package #:pulseaudio)

(defclass simple-stream ()
  ((raw-stream :accessor simple-stream-raw-stream)
   (error-code :initarg :error-code
               :accessor simple-stream-error-code)))

(defmethod open-stream ((stream (eql 'simple-stream))
                        appname direction
                        &key device description sample-spec
                             channel-map buffer-attributes)
  (let ((stream (make-instance 'simple-stream)))
    (setf (simple-stream-error-code stream) 0)
    (let ((server (cffi:null-pointer))
          (direction (raw-direction direction))
          (device (or device (cffi:null-pointer)))
          (channel-map (or channel-map (cffi:null-pointer)))
          (buffer-attributes (or buffer-attributes (cffi:null-pointer))))
      (setf (simple-stream-raw-stream stream)
            (pa-simple-new server appname direction device description
                           sample-spec channel-map buffer-attributes (cffi:null-pointer)))
      stream)))

(defmethod close-stream ((stream simple-stream))
  (unless (cffi:null-pointer-p (simple-stream-raw-stream stream))
    (pa-simple-free (simple-stream-raw-stream stream))))

(defmethod write-stream ((stream simple-stream) (data simple-array))
  (cffi:with-foreign-pointer (buf (length data))
    (cffi:lisp-array-to-foreign data buf (list :array :uint8 (length data)))
    (pa-simple-write (simple-stream-raw-stream stream) buf (length data) (cffi:null-pointer))))

(defmacro with-audio-stream ((stream &key (appname "cl-pulseaudio app")
                                          (direction :output)
                                          (device nil)
                                          (description "cl-pulseudio stream")
                                          (sample-format nil)
                                          (rate 44100)
                                          (channels 2)
                                          (channel-map nil)
                                          (buffer-attributes nil))
                             &body body)
  (let (($sample-spec (gensym)))
    `(cffi:with-foreign-objects ((,$sample-spec '(:struct pa_sample_spec)))
       (cffi:with-foreign-slots ((pa_sample_spec-format pa_sample_spec-channels pa_sample_spec-rate)
                                 ,$sample-spec (:struct pa_sample_spec))
         (setf pa_sample_spec-format (raw-sample-format ,sample-format)
               pa_sample_spec-channels ,channels
               pa_sample_spec-rate ,rate)
         (let ((,stream (open-stream 'simple-stream
                                     ,appname ,direction
                                     :device ,device
                                     :description ,description
                                     :sample-spec ,$sample-spec
                                     :channel-map ,channel-map
                                     :buffer-attributes ,buffer-attributes)))
           (unwind-protect
                (progn ,@body)
             (close-stream ,stream)))))))
