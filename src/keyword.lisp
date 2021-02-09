(defpackage #:pulseaudio.keyword
  (:use #:cl
        #:pulseaudio.cffi)
  (:export #:*available-sample-formats*
           #:raw-sample-format))
(in-package #:pulseaudio.keyword)

(defvar *available-sample-formats*
  '((:u8 . :pa_sample_u8)
    (:alaw . :pa_sample_alaw)
    (:ulaw . :pa_sample_ulaw)
    (:s16le . :pa_sample_s16le)
    (:s16be . :pa_sample_s16be)
    (:float32le . :pa_sample_float32le)
    (:float32be . :pa_sample_float32be)
    (:s32le . :pa_sample_s32le)
    (:s32be . :pa_sample_s32be)
    (:s24le . :pa_sample_s24le)
    (:s24be . :pa_sample_s24be)
    (:s24_32le . :pa_sample_s24-32le)
    (:s24_32be . :pa_sample_s24_32be)))

(defun raw-sample-format (keyword)
  (cdr (assoc keyword *available-sample-formats*)))
