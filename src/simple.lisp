(in-package :pulseaudio)

(cffi:defcfun "pa_simple_new" :pointer
  (server :string)
  (name :string)
  (dir pa_stream_direction_t)
  (dev :string)
  (stream_name :string)
  (ss  (:pointer pa_sample_spec))
  (map (:pointer #+nil pa_channel_map))
  (attr (:pointer pa_buffer_attr))
  (error (:pointer :int)))

(cffi:defcfun "pa_simple_free" :void
  (s :pointer))

(cffi:defcfun "pa_simple_write" :int
  (s :pointer)
  (data :pointer)
  (bytes size_t)
  (error (:pointer :int)))

(cffi:defcfun "pa_simple_drain" :int
  (s :pointer)
  (error (:pointer :int)))

(cffi:defcfun "pa_simple_read" :int
  (s :pointer)
  (data :pointer)
  (bytes size_t)
  (error (:pointer :int)))

(cffi:defcfun "pa_simple_get_latency" pa_usec_t
  (s :pointer)
  (error (:pointer :int)))

(cffi:defcfun "pa_simple_flush" :int
  (s :pointer)
  (error (:pointer :int)))

