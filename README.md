# cl-pulseaudio

[PulseAudio](https://www.freedesktop.org/wiki/Software/PulseAudio/) bindings for Common Lisp.

## Installation

TBD

## Usage

```lisp
;; play 440Hz sine wave for 1 second
(flet ((sine-to-byte (x)
         (coerce (floor (* 255 (+ 0.5 (/ (sin x) 2)))) '(unsigned-byte 8))))
  (let ((buffer (make-array 44100 :element-type '(unsigned-byte 8))))
    (pulseaudio:with-audio-stream (stream :sample-format :u8 :channels 1)
      (loop :for i :from 0 :below (length buffer)
            :for s := (sine-to-byte (* i (* (/ 440 44100) pi)))
            :do (setf (aref buffer i) s))
      (pulseaudio:write-stream stream buffer))))
```

## Authors

- SANO Masatoshi (<snmsts@gmail.com>)
- TANAKA Shinichi (<shinichi.tanaka45@gmail.com>)

## License

*cl-pulseaudio* is licensed under [the Lisp Lesser GNU General Public License (LLGPL)](http://opensource.franz.com/preamble.html).
