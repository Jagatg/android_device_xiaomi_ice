/*
 * Copyright (C) 2021 The LineageOS Project
 *
 * SPDX-License-Identifier: Apache-2.0
 */

#include <libinit_variant.h>
#include <unistd.h>

#include "vendor_init.h"

static const variant_info_t c3sfg_info = {
    .hwc_value = "",
    .sku_value = "c3sfg",
    .brand = "Redmi",
    .device = "ice",
    .marketname = "Redmi A1+",
    .model = "220733SFG",
    .build_fingerprint =
            "Redmi/snow_in/snow:12/SP1A.210812.016/V13.0.17.0.SGMINXM:user/release-keys",
};

static const variant_info_t c3sfin_info = {
    .hwc_value = "",
    .sku_value = "c3sfin",
    .brand = "Redmi",
    .device = "ice",
    .marketname = "Redmi A1+",
    .model = "220743FI",
    .build_fingerprint =
            "Redmi/snow_in/snow:12/SP1A.210812.016/V13.0.17.0.SGMINXM:user/release-keys",
};

static const variant_info_t c3sfinh_info = {
    .hwc_value = "",
    .sku_value = "c3sfinh",
    .brand = "Redmi",
    .device = "ice",
    .marketname = "Redmi A1+",
    .model = "220733SFH",
    .build_fingerprint =
            "Redmi/snow_in/snow:12/SP1A.210812.016/V13.0.17.0.SGMINXM:user/release-keys",
};

static const variant_info_t c3sg_info = {
    .hwc_value = "",
    .sku_value = "c3sg",
    .brand = "Redmi",
    .device = "ice",
    .marketname = "Redmi A1",
    .model = "220733SG",
    .build_fingerprint =
            "Redmi/ice_in/ice:12/SP1A.210812.016/V13.0.17.0.SGMINXM:user/release-keys",
};

static const variant_info_t c3sin_info = {
    .hwc_value = "",
    .sku_value = "c3sin",
    .brand = "Redmi",
    .device = "ice",
    .marketname = "Redmi A1",
    .model = "220733SI",
    .build_fingerprint =
            "Redmi/ice_in/ice:12/SP1A.210812.016/V13.0.17.0.SGMINXM:user/release-keys",
};

static const variant_info_t c3sinh_info = {
    .hwc_value = "",
    .sku_value = "c3sinh",
    .brand = "Redmi",
    .device = "ice",
    .marketname = "Redmi A1",
    .model = "220733SH",
    .build_fingerprint =
            "Redmi/ice_in/ice:12/SP1A.210812.016/V13.0.17.0.SGMINXM:user/release-keys",
};

static const variant_info_t c3sl_info = {
    .hwc_value = "",
    .sku_value = "c3sl",
    .brand = "Redmi",
    .device = "ice",
    .marketname = "Redmi A1",
    .model = "220733SL",
    .build_fingerprint =
            "Redmi/ice_in/ice:12/SP1A.210812.016/V13.0.17.0.SGMINXM:user/release-keys",
};

static const variant_info_t c3sp_info = {
    .hwc_value = "",
    .sku_value = "c3sp",
    .brand = "POCO",
    .device = "ice",
    .marketname = "POCO C50",
    .model = "220733SPI",
    .build_fingerprint =
            "POCO/snow_p_in/snow:12/SP1A.210812.016/V13.0.17.0.SGMINXM:user/release-keys",
};

static const variant_info_t c3sph_info = {
    .hwc_value = "",
    .sku_value = "c3sph",
    .brand = "POCO",
    .device = "ice",
    .marketname = "POCO C50",
    .model = "220733SPH",
    .build_fingerprint =
            "POCO/snow_p_in/snow:12/SP1A.210812.016/V13.0.17.0.SGMINXM:user/release-keys",
};

static const std::vector<variant_info_t> variants = {
    c3sfg_info,
    c3sfin_info,
    c3sfinh_info,
    c3sg_info,
    c3sin_info,
    c3sinh_info,
    c3sl_info,
    c3sp_info,
    c3sph_info,
};

void vendor_process_bootenv() {
    if (access("/system/bin/recovery", F_OK) != 0) {
        search_variant(variants);
    }
}

void vendor_load_properties() {
    vendor_process_bootenv();
}
