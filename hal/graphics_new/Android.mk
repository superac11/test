LOCAL_PATH:= $(call my-dir)

####################################
# libgui_ext.so
#

include $(CLEAR_VARS)

LOCAL_MODULE := libgui_ext
LOCAL_PROPRIETARY_MODULE := false
LOCAL_MODULE_TAGS := optional

ifeq ($(MTK_MIRAVISION_SUPPORT),yes)
LOCAL_CFLAGS += -DCONFIG_FOR_SOURCE_PQ
endif

LOCAL_SRC_FILES := \
    lib/IGuiExtService.cpp \
    lib/GuiExtService.cpp \
    lib/GuiExtClient.cpp  \
    lib/IDumpTunnel.cpp \
    lib/RefBaseDump.cpp 

LOCAL_C_INCLUDES := \
	$(LOCAL_PATH)/lib/inc/ \
	$(LOCAL_PATH)/lib/inc/mediatek/

LOCAL_SHARED_LIBRARIES := \
	libutils \
	libcutils \
	liblog \
	libbinder \
	libhardware \
	libhardware_legacy \
	libdl \
	libion \
	libion_mtk \
	libgralloc_extra \
	libgui \
	libui \
        libui_ext

include $(BUILD_SHARED_LIBRARY)

##################################################
# libui_ext.so
#

include $(CLEAR_VARS)

LOCAL_MODULE := libui_ext
LOCAL_PROPRIETARY_MODULE := true
LOCAL_MODULE_TAGS := optional

LOCAL_SRC_FILES := \
	lib/ui_ext/FpsCounter.cpp \
	lib/ui_ext/SWWatchDog.cpp \
	lib/ui_ext/GraphicBufferUtil.cpp \
	lib/IDumpTunnel.cpp

LOCAL_C_INCLUDES := \
	$(LOCAL_PATH)/lib/inc/ \
	$(LOCAL_PATH)/lib/inc/ui_ext/ \
	$(LOCAL_PATH)/lib/inc/mediatek/ \
	$(TOP)/external/libpng \
	$(TOP)/external/zlib \
	$(TOP)/external/skia/src/images \
	$(TOP)/external/skia/include/core \
	$(TOP)/external/skia/include/config \
	$(TOP)/external/skia/src/core \
	$(TOP)/external/skia/include/private

LOCAL_SHARED_LIBRARIES := \
	libutils \
	libcutils \
	liblog \
	libbinder \
	libhardware \
	libdl \
	libui \
	libpng \
	libgralloc_extra \
	libnativewindow

LOCAL_CFLAGS += -DMTK_AOSP_ENHANCEMENT
LOCAL_CPPFLAGS += -DMTK_AOSP_ENHANCEMENT

include $(BUILD_SHARED_LIBRARY)

######################################################

include $(call all-makefiles-under,$(LOCAL_PATH))
