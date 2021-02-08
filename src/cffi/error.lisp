(in-package :pulseaudio.cffi)

(cffi:defcfun "pa_strerror" :string (error :int))
