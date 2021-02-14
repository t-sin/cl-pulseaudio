(defpackage #:pulseaudio.keyword
  (:use #:cl
        #:pulseaudio.cffi)
  (:export #:*available-sample-formats*
           #:raw-sample-format
           #:*available-directions*
           #:raw-direction))
(in-package #:pulseaudio.keyword)

(defvar *available-sample-formats*
  `((:u8 . ,PA_SAMPLE_U8)
    (:alaw . ,PA_SAMPLE_ALAW)
    (:ulaw . ,PA_SAMPLE_ULAW)
    (:s16le . ,PA_SAMPLE_S16LE)
    (:s16be . ,PA_SAMPLE_S16BE)
    (:float32le . ,PA_SAMPLE_FLOAT32LE)
    (:float32be . ,PA_SAMPLE_FLOAT32BE)
    (:s32le . ,PA_SAMPLE_S32LE)
    (:s32be . ,PA_SAMPLE_S32BE)
    (:s24le . ,PA_SAMPLE_S24LE)
    (:s24be . ,PA_SAMPLE_S24BE)
    (:s24_32le . ,PA_SAMPLE_S24_32LE)
    (:s24_32be . ,PA_SAMPLE_S24_32BE)))

(defun raw-sample-format (keyword)
  (cdr (assoc keyword *available-sample-formats*)))

(defvar *available-directions*
  `((:input . ,PA_STREAM_RECORD)
    (:output . ,PA_STREAM_PLAYBACK)))

(defun raw-direction (keyword)
  (cdr (assoc keyword *available-directions*)))
