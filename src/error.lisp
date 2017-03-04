(in-package :pulseaudio)

(cffi:defcfun "pa_strerror" :string (error :int))
