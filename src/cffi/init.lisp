(in-package :common-lisp)
(defpackage :pulseaudio.cffi
  (:use :cl)
  (:export
   :pa_sample_spec
   :pa_sample_spec-format
   :pa_sample_spec-rate
   :pa_sample_spec-channels
   
   :pa_buffer_attr
   :pa_buffer_attr-maxlength
   :pa_buffer_attr-rate
   :pa_buffer_attr-prebuf
   :pa_buffer_attr-minreq
   :pa_buffer_attr-fragsize
   
   :pa_timing_info
   :pa_timing_info-timestamp
   :pa_timing_info-synchronized_clocks
   :pa_timing_info-sink_usec
   :pa_timing_info-source_usec
   :pa_timing_info-transport_usec
   :pa_timing_info-playing
   :pa_timing_info-write_index_corrupt
   :pa_timing_info-write_index
   :pa_timing_info-read_index_corrupt
   :pa_timing_info-read_index
   :pa_timing_info-configured_sink_usec
   :pa_timing_info-configured_source_usec
   :pa_timing_info-since_underrun
   
   :pa_spawn_api
   :pa_spawn_api-prefork
   :pa_spawn_api-postfork
   :pa_spawn_api-atfork

   :pa_source_running
   :pa_sample_float32re
   :pa_subscription_mask_autoload
   :pa_stream_early_requests
   :pa_subscription_event_new
   :pa_stream_nodirection
   :pa_context_ready
   :pa_subscription_event_autoload
   :pa_stream_fix_rate
   :pa_sample_s24_32re
   :pa_stream_not_monotonic
   :pa_sample_float32le
   :size-of-pa_sample_format_t
   :pa_sample_spec_snprint_max
   :pa_stream_upload
   :pa_err_toolarge
   :pa_sample_s24_32ne
   :pa_sample_s24ne
   :pa_err_internal
   :pa_stream_auto_timing_update
   :pa_stream_fail_on_suspend
   :pa_err_obsolete
   :pa_context_nofail
   :pa_sample_s24_32le
   :pa_err_nodata
   :pa_sample_float32be
   :pa_stream_terminated
   :pa_sample_ulaw
   :pa_subscription_event_source_output
   :pa_context_unconnected
   :pa_sample_s24re
   :pa_stream_adjust_latency
   :pa_stream_dont_inhibit_auto_suspend
   :pa_err_invalidserver
   :pa_sample_s24_32be
   :pa_err_noentity
   :pa_err_notimplemented
   :pa_subscription_mask_module
   :pa_subscription_event_sample_cache
   :pa_port_available_no
   :pa_sink_suspended
   :size-of-size_t
   :pa_subscription_mask_sample_cache
   :pa_err_timeout
   :pa_sample_s16re
   :pa_source_unlinked
   :pa_stream_ready
   :pa_subscription_event_change
   :pa_stream_relative_volume
   :pa_source_suspended
   :pa_subscription_event_source
   :pa_sample_s16le
   :pa_stream_start_unmuted
   :pa_err_killed
   :pa_subscription_mask_source_output
   :size-of-uint32_t
   :pa_stream_fix_format
   :pa_source_decibel_volume
   :pa_source_hw_volume_ctrl
   :pa_sink_hw_volume_ctrl
   :pa_sink_set_formats
   :pa_subscription_mask_client
   :size-of-suseconds_t
   :size-of-pa_timing_info
   :size-of-pa_buffer_attr
   :pa_sink_unlinked
   :pa_bytes_snprint_max
   :pa_sample_float32
   :pa_err_access
   :pa_sample_alaw
   :pa_device_type_sink
   :pa_context_noautospawn
   :pa_err_exist
   :pa_subscription_event_client
   :pa_source_latency
   :pa_sample_u8
   :pa_err_connectionrefused
   :pa_operation_running
   :pa_subscription_event_type_mask
   :pa_subscription_event_facility_mask
   :pa_subscription_event_sink
   :pa_err_noextension
   :pa_source_init
   :pa_context_connecting
   :pa_subscription_event_server
   :pa_subscription_mask_card
   :pa_source_network
   :pa_err_version
   :pa_err_invalid
   :pa-strerror
   :pa_stream_no_remap_channels
   :pa_sink_hardware
   :pa_operation_done
   :pa_sink_decibel_volume
   :pa_subscription_mask_server
   :pa_seek_absolute
   :pa_context_setting_name
   :pa_sample_s24le
   :pa_subscription_event_sink_input
   :pa_direction_output
   :pa_subscription_mask_source
   :pa_stream_fix_channesl
   :pa_invalid_index
   :pa_ok
   :pa_err_badstate
   :pa_source_invalid_state
   :pa_sink_idle
   :pa_stream_interpolate_timing
   :pa_err_protocol
   :pa_err_connectionterminated
   :size-of-pa_spawn_api
   :pa_port_available_yes
   :pa_subscription_event_remove
   :pa_err_unknown
   :pa_seek_relative
   :size-of-pa_stream_direction_t
   :pa_sample_s32ne
   :pa_seek_relative_on_read
   :pa_sample_s32le
   :pa_stream_peak_detect
   :pa_sink_network
   :pa_stream_passthrough
   :pa_sample_s16ne
   :pa_device_type_source
   :pa_err_authkey
   :pa_stream_record
   :pa_sample_s24be
   :pa_sample_s32be
   :pa_sink_invalid_state
   :pa_subscription_mask_all
   :pa_stream_dont_move
   :pa_stream_creating
   :pa_source_idle
   :pa_sample_s16be
   :size-of-time_t
   :pa_context_terminated
   :pa_operation_cancelled
   :pa_stream_start_corked
   :pa_port_available_unknown
   :pa_sink_init
   :pa_err_forked
   :pa_sink_latency
   :pa_stream_start_muted
   :size-of-pa_usec_t
   :pa_err_max
   :pa_source_hardware
   :pa_stream_failed
   :pa_rate_max
   :pa_source_dynamic_latency
   :pa_sink_flat_volume
   :pa_sample_float32ne
   :pa_subscription_mask_sink_input
   :pa_context_authorizing
   :size-of-timeval
   :pa_err_command
   :pa_stream_variable_rate
   :pa_direction_input
   :pa_source_hw_mute_ctrl
   :pa_stream_unconnected
   :pa_stream_no_remix_channels
   :pa_err_notsupported
   :pa_source_flat_volume
   :size-of-pa_sample_spec
   :pa_err_modinitfailed
   :pa_stream_playback
   :pa_subscription_event_module
   :size-of-int64_t
   :size-of-uint8_t
   :pa_sink_dynamic_latency
   :pa_subscription_event_card
   :pa_subscription_mask_sink
   :pa_seek_relative_end
   :pa_sink_hw_mute_ctrl
   :pa_sample_s32re
   :pa_context_failed
   :pa_subscription_mask_null

   :pa-simple-new
   :pa-simple-free
   :pa-simple-drain
   :pa-simple-flush
   :pa-simple-get-latency
   :pa-simple-read
   :pa-simple-write
   ))

(in-package :pulseaudio.cffi)

(cffi:define-foreign-library libpulse
  (t (:default "libpulse")))

(cffi:use-foreign-library libpulse)

(cffi:define-foreign-library libpulse-simple
  (t (:default "libpulse-simple")))

(cffi:use-foreign-library libpulse-simple)

#+nil
(let (result)
  (do-symbols (i *package*)
    (when (and (eql (symbol-package i) *package*)
               (or (boundp i)
                   (fboundp i)))
      (push i result)))
  (format t "(~{~(:~A~)~^~%~})"
          result))
