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
	libui

include $(BUILD_SHARED_LIBRARY)

include $(call all-makefiles-under,$(LOCAL_PATH))

#####################################
