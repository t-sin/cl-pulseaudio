# cl-pulseaudio

[PulseAudio](https://www.freedesktop.org/wiki/Software/PulseAudio/) bindings for Common Lisp. It's tested on SBCL.

## Requirements

- PulseAudio
- libpulse-dev

## Installation

With [Roswell](https://github.com/roswell/roswell), type `ros install t-sin/cl-pulseaudio`.
Or simply copy this repository into your ASDF load path.

## Usage

```lisp
;; play 440Hz sine wave for 1 second
(let* ((rate 44100)
       (buffer (make-array rate :element-type '(unsigned-byte 8))))
  (flet ((sine-to-byte (x)
           (coerce (floor (* 255 (+ 0.5 (/ (sin x) 2)))) '(unsigned-byte 8))))
    (pulseaudio:with-audio-stream (stream :sample-format :u8 :channels 1 :buffer-size rate)
      (loop :for i :from 0 :below (length buffer)
            :for s := (sine-to-byte (* i (* (/ 440 rate) pi)))
            :do (setf (aref buffer i) s))
      (pulseaudio:write-stream stream buffer))))
```

## Limitation

This library uses [PulseAudio Simple API (synchronous API)](https://freedesktop.org/software/pulseaudio/doxygen/simple.html) so threading is roughly implemented by this. If you yuse the editor interrupts (e.g. C-c C-c), it breaks PulseAudio sound threads. When it happens Lisp process will be hang up.

## Authors

- SANO Masatoshi (<snmsts@gmail.com>)
- TANAKA Shinichi (<shinichi.tanaka45@gmail.com>)

## License

*cl-pulseaudio* is licensed under [the Lisp Lesser GNU General Public License (LLGPL)](http://opensource.franz.com/preamble.html).
