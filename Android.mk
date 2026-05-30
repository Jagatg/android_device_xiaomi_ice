LOCAL_PATH := $(call my-dir)

ifeq ($(TARGET_DEVICE),ice)
include $(call all-makefiles-under,$(LOCAL_PATH))
endif

LOCAL_PATH := $(call my-dir)

include $(CLEAR_VARS)
LOCAL_MODULE := kernel
LOCAL_MODULE_STEM := kernel
LOCAL_MODULE_CLASS := ETC
LOCAL_MODULE_TAGS := optional
LOCAL_PREBUILT_MODULE_FILE := $(LOCAL_PATH)-kernel/kernel
LOCAL_MODULE_PATH := $(PRODUCT_OUT)
include $(BUILD_PREBUILT)

ifeq ($(TARGET_DEVICE),ice)
include $(call all-makefiles-under,$(LOCAL_PATH))
endif
