find_path(LIBJINGLE_INCLUDE_DIR 
	NAMES 
		talk/app/webrtc/peerconnectioninterface.h
	HINTS
		${LIBJINGLE_ROOT_DIR}
		ENV LIBJINGLE_ROOT_DIR
	DOC
		"libjingle include directory path"
)

find_path(LIBJINGLE_THIRD_PARTY_INCLUDE_DIR 
	NAMES 
		webrtc/common_types.h
	HINTS
		${LIBJINGLE_ROOT_DIR}
		ENV LIBJINGLE_ROOT_DIR
	PATH_SUFFIXES
		third_party
	DOC
		"libjingle/third_party include directory path"
)

find_path(LIBJINGLE_WEBRTC_INCLUDE_DIR 
	NAMES 
		common_types.h
	HINTS
		${LIBJINGLE_ROOT_DIR}
		ENV LIBJINGLE_ROOT_DIR
	PATH_SUFFIXES
		third_party/webrtc
	DOC
		"libjingle/third_party/webrtc include directory path"
)

set(REQUIRED_VARS LIBJINGLE_INCLUDE_DIR LIBJINGLE_THIRD_PARTY_INCLUDE_DIR LIBJINGLE_WEBRTC_INCLUDE_DIR)

if(WIN32)
	set(LIBJINGLE_SYSTEM_LIBS
		wininet  
		dnsapi  
		version  
		msimg32  
		ws2_32  
		usp10  
		psapi  
		dbghelp  
		winmm  
		shlwapi  
		kernel32  
		gdi32  
		winspool  
		comdlg32  
		advapi32  
		shell32  
		ole32  
		oleaut32  
		user32  
		uuid  
		odbc32  
		odbccp32  
		delayimp  
		Strmiids  
		dmoguids  
		wmcodecdspuuid  
		amstrmid  
		msdmo
	)
	macro(set_libjingle_libs VARNAME CONFIGURATION)
		set(${VARNAME}
			${LIBJINGLE_SYSTEM_LIBS}
			${LIBJINGLE_ROOT_DIR}/build/${CONFIGURATION}/lib/jsoncpp.lib 
			${LIBJINGLE_ROOT_DIR}/build/${CONFIGURATION}/lib/libjingle_peerconnection.lib 
			${LIBJINGLE_ROOT_DIR}/build/${CONFIGURATION}/lib/libjingle.lib 
			${LIBJINGLE_ROOT_DIR}/build/${CONFIGURATION}/lib/expat.lib 
			${LIBJINGLE_ROOT_DIR}/build/${CONFIGURATION}/lib/crnss.lib 
			${LIBJINGLE_ROOT_DIR}/build/${CONFIGURATION}/lib/nss_static.lib 
			${LIBJINGLE_ROOT_DIR}/build/${CONFIGURATION}/lib/crnspr.lib 
			${LIBJINGLE_ROOT_DIR}/build/${CONFIGURATION}/lib/sqlite3.lib 
			${LIBJINGLE_ROOT_DIR}/build/${CONFIGURATION}/lib/icui18n.lib 
			${LIBJINGLE_ROOT_DIR}/build/${CONFIGURATION}/lib/icuuc.lib 
			${LIBJINGLE_ROOT_DIR}/build/${CONFIGURATION}/lib/libjingle_media.lib 
			${LIBJINGLE_ROOT_DIR}/build/${CONFIGURATION}/lib/libyuv.lib 
			${LIBJINGLE_ROOT_DIR}/build/${CONFIGURATION}/lib/libjpeg.lib 
			${LIBJINGLE_ROOT_DIR}/build/${CONFIGURATION}/lib/video_capture_module.lib 
			${LIBJINGLE_ROOT_DIR}/build/${CONFIGURATION}/lib/webrtc_utility.lib 
			${LIBJINGLE_ROOT_DIR}/build/${CONFIGURATION}/lib/audio_coding_module.lib 
			${LIBJINGLE_ROOT_DIR}/build/${CONFIGURATION}/lib/CNG.lib 
			${LIBJINGLE_ROOT_DIR}/build/${CONFIGURATION}/lib/signal_processing.lib 
			${LIBJINGLE_ROOT_DIR}/build/${CONFIGURATION}/lib/system_wrappers.lib 
			${LIBJINGLE_ROOT_DIR}/build/${CONFIGURATION}/lib/G711.lib 
			${LIBJINGLE_ROOT_DIR}/build/${CONFIGURATION}/lib/G722.lib 
			${LIBJINGLE_ROOT_DIR}/build/${CONFIGURATION}/lib/iLBC.lib 
			${LIBJINGLE_ROOT_DIR}/build/${CONFIGURATION}/lib/iSAC.lib 
			${LIBJINGLE_ROOT_DIR}/build/${CONFIGURATION}/lib/iSACFix.lib 
			${LIBJINGLE_ROOT_DIR}/build/${CONFIGURATION}/lib/PCM16B.lib 
			${LIBJINGLE_ROOT_DIR}/build/${CONFIGURATION}/lib/NetEq.lib 
			${LIBJINGLE_ROOT_DIR}/build/${CONFIGURATION}/lib/resampler.lib 
			${LIBJINGLE_ROOT_DIR}/build/${CONFIGURATION}/lib/vad.lib 
			${LIBJINGLE_ROOT_DIR}/build/${CONFIGURATION}/lib/webrtc_opus.lib 
			${LIBJINGLE_ROOT_DIR}/build/${CONFIGURATION}/lib/opus.lib 
			${LIBJINGLE_ROOT_DIR}/build/${CONFIGURATION}/lib/webrtc_video_coding.lib 
			${LIBJINGLE_ROOT_DIR}/build/${CONFIGURATION}/lib/webrtc_i420.lib 
			${LIBJINGLE_ROOT_DIR}/build/${CONFIGURATION}/lib/common_video.lib 
			${LIBJINGLE_ROOT_DIR}/build/${CONFIGURATION}/lib/video_coding_utility.lib 
			${LIBJINGLE_ROOT_DIR}/build/${CONFIGURATION}/lib/webrtc_vp8.lib 
			${LIBJINGLE_ROOT_DIR}/build/${CONFIGURATION}/lib/libvpx.lib 
			${LIBJINGLE_ROOT_DIR}/build/${CONFIGURATION}/lib/libvpx_asm_offsets.lib 
			${LIBJINGLE_ROOT_DIR}/build/${CONFIGURATION}/lib/libvpx_asm_offsets_vp9.lib 
			${LIBJINGLE_ROOT_DIR}/build/${CONFIGURATION}/lib/libvpx_intrinsics.lib 
			${LIBJINGLE_ROOT_DIR}/build/${CONFIGURATION}/lib/directshow_baseclasses.lib 
			${LIBJINGLE_ROOT_DIR}/build/${CONFIGURATION}/lib/video_render_module.lib 
			${LIBJINGLE_ROOT_DIR}/build/${CONFIGURATION}/lib/video_engine_core.lib 
			${LIBJINGLE_ROOT_DIR}/build/${CONFIGURATION}/lib/media_file.lib 
			${LIBJINGLE_ROOT_DIR}/build/${CONFIGURATION}/lib/rtp_rtcp.lib 
			${LIBJINGLE_ROOT_DIR}/build/${CONFIGURATION}/lib/remote_bitrate_estimator.lib 
			${LIBJINGLE_ROOT_DIR}/build/${CONFIGURATION}/lib/paced_sender.lib 
			${LIBJINGLE_ROOT_DIR}/build/${CONFIGURATION}/lib/udp_transport.lib 
			${LIBJINGLE_ROOT_DIR}/build/${CONFIGURATION}/lib/bitrate_controller.lib 
			${LIBJINGLE_ROOT_DIR}/build/${CONFIGURATION}/lib/video_processing.lib 
			${LIBJINGLE_ROOT_DIR}/build/${CONFIGURATION}/lib/video_processing_sse2.lib 
			${LIBJINGLE_ROOT_DIR}/build/${CONFIGURATION}/lib/voice_engine_core.lib 
			${LIBJINGLE_ROOT_DIR}/build/${CONFIGURATION}/lib/audio_conference_mixer.lib 
			${LIBJINGLE_ROOT_DIR}/build/${CONFIGURATION}/lib/audio_processing.lib 
			${LIBJINGLE_ROOT_DIR}/build/${CONFIGURATION}/lib/audioproc_debug_proto.lib 
			${LIBJINGLE_ROOT_DIR}/build/${CONFIGURATION}/lib/protobuf_lite.lib 
			${LIBJINGLE_ROOT_DIR}/build/${CONFIGURATION}/lib/audio_processing_sse2.lib 
			${LIBJINGLE_ROOT_DIR}/build/${CONFIGURATION}/lib/audio_device.lib 
			${LIBJINGLE_ROOT_DIR}/build/${CONFIGURATION}/lib/libjingle_sound.lib 
			${LIBJINGLE_ROOT_DIR}/build/${CONFIGURATION}/lib/libjingle_p2p.lib 
			${LIBJINGLE_ROOT_DIR}/build/${CONFIGURATION}/lib/libsrtp.lib
		)
	endmacro()
	set_libjingle_libs(LIBJINGLE_LIBRARIES_RELEASE Release)
	set_libjingle_libs(LIBJINGLE_LIBRARIES_DEBUG Debug)
	set_libjingle_libs(LIBJINGLE_LIBRARIES ${CMAKE_BUILD_TYPE})
elseif(${CMAKE_SYSTEM_NAME} MATCHES "Darwin")
        macro(set_libjingle_libs VARNAME CONFIGURATION)
                set(${VARNAME}
                        ${LIBJINGLE_ROOT_DIR}/xcodebuild/${CONFIGURATION}/libCNG.a
                        ${LIBJINGLE_ROOT_DIR}/xcodebuild/${CONFIGURATION}/libG711.a
                        ${LIBJINGLE_ROOT_DIR}/xcodebuild/${CONFIGURATION}/libG722.a
                        ${LIBJINGLE_ROOT_DIR}/xcodebuild/${CONFIGURATION}/libNetEq.a
                        ${LIBJINGLE_ROOT_DIR}/xcodebuild/${CONFIGURATION}/libPCM16B.a
                        ${LIBJINGLE_ROOT_DIR}/xcodebuild/${CONFIGURATION}/libaudio_coding_module.a
                        ${LIBJINGLE_ROOT_DIR}/xcodebuild/${CONFIGURATION}/libaudio_conference_mixer.a
                        ${LIBJINGLE_ROOT_DIR}/xcodebuild/${CONFIGURATION}/libaudio_device.a
                        ${LIBJINGLE_ROOT_DIR}/xcodebuild/${CONFIGURATION}/libaudio_processing.a
                        ${LIBJINGLE_ROOT_DIR}/xcodebuild/${CONFIGURATION}/libaudio_processing_sse2.a
                        ${LIBJINGLE_ROOT_DIR}/xcodebuild/${CONFIGURATION}/libaudioproc_debug_proto.a
                        ${LIBJINGLE_ROOT_DIR}/xcodebuild/${CONFIGURATION}/libbitrate_controller.a
                        ${LIBJINGLE_ROOT_DIR}/xcodebuild/${CONFIGURATION}/libcommon_video.a
                        ${LIBJINGLE_ROOT_DIR}/xcodebuild/${CONFIGURATION}/libcrnspr.a
                        ${LIBJINGLE_ROOT_DIR}/xcodebuild/${CONFIGURATION}/libcrnss.a
                        ${LIBJINGLE_ROOT_DIR}/xcodebuild/${CONFIGURATION}/libexpat.a
                        ${LIBJINGLE_ROOT_DIR}/xcodebuild/${CONFIGURATION}/libgenperf_libs.a
                        ${LIBJINGLE_ROOT_DIR}/xcodebuild/${CONFIGURATION}/libiLBC.a
                        ${LIBJINGLE_ROOT_DIR}/xcodebuild/${CONFIGURATION}/libiSAC.a
                        ${LIBJINGLE_ROOT_DIR}/xcodebuild/${CONFIGURATION}/libiSACFix.a
                        ${LIBJINGLE_ROOT_DIR}/xcodebuild/${CONFIGURATION}/libicudata.a
                        ${LIBJINGLE_ROOT_DIR}/xcodebuild/${CONFIGURATION}/libicui18n.a
                        ${LIBJINGLE_ROOT_DIR}/xcodebuild/${CONFIGURATION}/libicuuc.a
                        ${LIBJINGLE_ROOT_DIR}/xcodebuild/${CONFIGURATION}/libjingle.a
                        ${LIBJINGLE_ROOT_DIR}/xcodebuild/${CONFIGURATION}/libjingle_media.a
                        ${LIBJINGLE_ROOT_DIR}/xcodebuild/${CONFIGURATION}/libjingle_p2p.a
                        ${LIBJINGLE_ROOT_DIR}/xcodebuild/${CONFIGURATION}/libjingle_peerconnection.a
                        ${LIBJINGLE_ROOT_DIR}/xcodebuild/${CONFIGURATION}/libjingle_sound.a
                        ${LIBJINGLE_ROOT_DIR}/xcodebuild/${CONFIGURATION}/libjingle_xmpphelp.a
                        ${LIBJINGLE_ROOT_DIR}/xcodebuild/${CONFIGURATION}/libjpeg_turbo.a
                        ${LIBJINGLE_ROOT_DIR}/xcodebuild/${CONFIGURATION}/libjsoncpp.a
                        ${LIBJINGLE_ROOT_DIR}/xcodebuild/${CONFIGURATION}/libmedia_file.a
                        ${LIBJINGLE_ROOT_DIR}/xcodebuild/${CONFIGURATION}/libnss_static.a
                        ${LIBJINGLE_ROOT_DIR}/xcodebuild/${CONFIGURATION}/libopus.a
                        ${LIBJINGLE_ROOT_DIR}/xcodebuild/${CONFIGURATION}/libpaced_sender.a
                        ${LIBJINGLE_ROOT_DIR}/xcodebuild/${CONFIGURATION}/libprotobuf_full_do_not_use.a
                        ${LIBJINGLE_ROOT_DIR}/xcodebuild/${CONFIGURATION}/libprotobuf_lite.a
                        ${LIBJINGLE_ROOT_DIR}/xcodebuild/${CONFIGURATION}/libremote_bitrate_estimator.a
                        ${LIBJINGLE_ROOT_DIR}/xcodebuild/${CONFIGURATION}/libresampler.a
                        ${LIBJINGLE_ROOT_DIR}/xcodebuild/${CONFIGURATION}/librtp_rtcp.a
                        ${LIBJINGLE_ROOT_DIR}/xcodebuild/${CONFIGURATION}/libsignal_processing.a
                        ${LIBJINGLE_ROOT_DIR}/xcodebuild/${CONFIGURATION}/libsqlite3.a
                        ${LIBJINGLE_ROOT_DIR}/xcodebuild/${CONFIGURATION}/libsrtp.a
                        ${LIBJINGLE_ROOT_DIR}/xcodebuild/${CONFIGURATION}/libsystem_wrappers.a
                        ${LIBJINGLE_ROOT_DIR}/xcodebuild/${CONFIGURATION}/libudp_transport.a
                        ${LIBJINGLE_ROOT_DIR}/xcodebuild/${CONFIGURATION}/libvad.a
                        ${LIBJINGLE_ROOT_DIR}/xcodebuild/${CONFIGURATION}/libvideo_capture_module.a
                        ${LIBJINGLE_ROOT_DIR}/xcodebuild/${CONFIGURATION}/libvideo_coding_utility.a
                        ${LIBJINGLE_ROOT_DIR}/xcodebuild/${CONFIGURATION}/libvideo_engine_core.a
                        ${LIBJINGLE_ROOT_DIR}/xcodebuild/${CONFIGURATION}/libvideo_processing.a
                        ${LIBJINGLE_ROOT_DIR}/xcodebuild/${CONFIGURATION}/libvideo_processing_sse2.a
                        ${LIBJINGLE_ROOT_DIR}/xcodebuild/${CONFIGURATION}/libvideo_render_module.a
                        ${LIBJINGLE_ROOT_DIR}/xcodebuild/${CONFIGURATION}/libvoice_engine_core.a
                        ${LIBJINGLE_ROOT_DIR}/xcodebuild/${CONFIGURATION}/libvpx.a
                        ${LIBJINGLE_ROOT_DIR}/xcodebuild/${CONFIGURATION}/libvpx_asm_offsets.a
                        ${LIBJINGLE_ROOT_DIR}/xcodebuild/${CONFIGURATION}/libvpx_asm_offsets_vp9.a
                        ${LIBJINGLE_ROOT_DIR}/xcodebuild/${CONFIGURATION}/libvpx_intrinsics.a
                        ${LIBJINGLE_ROOT_DIR}/xcodebuild/${CONFIGURATION}/libwebrtc_i420.a
                        ${LIBJINGLE_ROOT_DIR}/xcodebuild/${CONFIGURATION}/libwebrtc_opus.a
                        ${LIBJINGLE_ROOT_DIR}/xcodebuild/${CONFIGURATION}/libwebrtc_utility.a
                        ${LIBJINGLE_ROOT_DIR}/xcodebuild/${CONFIGURATION}/libwebrtc_video_coding.a
                        ${LIBJINGLE_ROOT_DIR}/xcodebuild/${CONFIGURATION}/libwebrtc_vp8.a
                        ${LIBJINGLE_ROOT_DIR}/xcodebuild/${CONFIGURATION}/libyuv.a
                   )
        endmacro()
        set_libjingle_libs(LIBJINGLE_LIBRARIES_RELEASE Release)
        set_libjingle_libs(LIBJINGLE_LIBRARIES_DEBUG Debug)
        set_libjingle_libs(LIBJINGLE_LIBRARIES ${CMAKE_BUILD_TYPE})
        find_library(AUDIOTOOLBOX_LIBRARY AudioToolbox REQUIRED)
        find_library(COREAUDIO_LIBRARY CoreAudio REQUIRED)
        find_library(CARBON_LIBRARY Carbon REQUIRED)
        find_library(COCOA_LIBRARY Cocoa REQUIRED)
        find_library(FOUNDATION_LIBRARY Foundation REQUIRED)
        find_library(SYSTEMCONFIGURATION_LIBRARY SystemConfiguration REQUIRED)
        find_library(SECURITY_LIBRARY Security REQUIRED)
        find_library(OPENGL_LIBRARY OpenGL REQUIRED)
        find_library(COREVIDEO_LIBRARY CoreVideo REQUIRED)
        find_library(QTKIT_LIBRARY QTKit REQUIRED)
        list(APPEND LIBJINGLE_LIBRARIES ${AUDIOTOOLBOX_LIBRARY}
                                        ${CARBON_LIBRARY}
                                        ${COCOA_LIBRARY}
                                        ${FOUNDATION_LIBRARY}
                                        ${SYSTEMCONFIGURATION_LIBRARY}
                                        ${SECURITY_LIBRARY}
                                        ${OPENGL_LIBRARY}
                                        ${COREVIDEO_LIBRARY}
                                        ${COREAUDIO_LIBRARY}
                                        ${QTKIT_LIBRARY})
        list(APPEND LIBJINGLE_LIBRARIES_DEBUG ${AUDIOTOOLBOX_LIBRARY}
                                              ${CARBON_LIBRARY}
                                              ${COCOA_LIBRARY}
                                              ${FOUNDATION_LIBRARY}
                                              ${SYSTEMCONFIGURATION_LIBRARY}
                                              ${SECURITY_LIBRARY}
                                              ${OPENGL_LIBRARY}
                                              ${COREVIDEO_LIBRARY}
                                              ${COREAUDIO_LIBRARY}
                                              ${QTKIT_LIBRARY})
        list(APPEND LIBJINGLE_LIBRARIES_RELEASE ${AUDIOTOOLBOX_LIBRARY}
                                                ${CARBON_LIBRARY}
                                                ${COCOA_LIBRARY}
                                                ${FOUNDATION_LIBRARY}
                                                ${SYSTEMCONFIGURATION_LIBRARY}
                                                ${SECURITY_LIBRARY}
                                                ${OPENGL_LIBRARY}
                                                ${COREVIDEO_LIBRARY}
                                                ${COREAUDIO_LIBRARY}
                                                ${QTKIT_LIBRARY})
endif()

# handle the QUIETLY and REQUIRED arguments and set SOFIA_SIP_UA_FOUND to TRUE if
# all listed variables are TRUE
include(FindPackageHandleStandardArgs)
FIND_PACKAGE_HANDLE_STANDARD_ARGS(LIBJINGLE
                                  REQUIRED_VARS ${REQUIRED_VARS})

# Copy the results to the output variables.
if(LIBJINGLE_FOUND)
  set(LIBJINGLE_INCLUDE_DIRS ${LIBJINGLE_INCLUDE_DIR} ${LIBJINGLE_THIRD_PARTY_INCLUDE_DIR} ${LIBJINGLE_WEBRTC_INCLUDE_DIR})
endif()

mark_as_advanced(${REQUIRED_VARS})
