LOCAL_PATH := $(call my-dir)

ifeq ($(TARGET_DEVICE),ice)
include $(call all-makefiles-under,$(LOCAL_PATH))
endif

