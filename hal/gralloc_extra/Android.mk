LOCAL_PATH := $(call my-dir)
############

include $(CLEAR_VARS)

LOCAL_MODULE := libgralloc_extra

LOCAL_SRC_FILES := \
    platform/ge_platform_default.c \
    platform/default/platform.c
#    ge_misc.c \
#    ge_operator.cpp

LOCAL_C_INCLUDES := \
    $(LOCAL_PATH)/include/ \
    $(LOCAL_PATH)/include/ged/ \
    $(TOP)/system/core/libion/include

LOCAL_EXPORT_C_INCLUDE_DIRS := \
    $(LOCAL_PATH)/include

LOCAL_SHARED_LIBRARIES := \
    libhardware \
    libcutils \
    libutils \
    liblog \
    libion \
    libion_mtk \
    libged

LOCAL_PROPRIETARY_MODULE := true
LOCAL_MODULE_TAGS := optional

include $(BUILD_SHARED_LIBRARY)


###############################################################################
# Gralloc Extra Test
# #
#
ifneq ($(TARGET_2ND_ARCH), "")

include $(CLEAR_VARS)

test-sanity-gralloc_extra: lpath := $(LOCAL_PATH)
test-sanity-gralloc_extra: o32 := $(TARGET_OUT)/vendor/lib/libgralloc_extra.so
test-sanity-gralloc_extra: o64 := $(TARGET_OUT)/vendor/lib64/libgralloc_extra.so
test-sanity-gralloc_extra: $(TARGET_OUT)/vendor/lib/libgralloc_extra.so $(TARGET_OUT)/vendor/lib64/libgralloc_extra.so
	@\
	s32=`gdb -batch $(o32) -ex "p _ge_check_size"`; \
	s64=`gdb -batch $(o64) -ex "p _ge_check_size"`; \
	if [ "$$s32" == "$$s64" ] ; \
		then echo "Sanity-gralloc_extra: Pass"; \
		else echo "Sanity-gralloc_extra: check error:"; \
			echo " *** DO NOT USE A ARCH-DEP TYPE (example: pointer *)"; \
			echo " *** size (32bit) is: $$s32"; \
			echo " *** size (64bit) is: $$s64"; \
			echo " *** please check all struct in GE_LIST @ ge_config.h"; \
			false; \
	fi

LOCAL_SHARED_LIBRARIES := libgralloc_extra

LOCAL_MODULE := test-sanity-gralloc_extra

include $(BUILD_PHONY_PACKAGE)

endif
