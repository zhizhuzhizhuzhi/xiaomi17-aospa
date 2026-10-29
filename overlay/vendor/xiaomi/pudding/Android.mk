#
# Automatically generated file. DO NOT MODIFY
#

LOCAL_PATH := $(call my-dir)

ifeq ($(TARGET_DEVICE),pudding)

# AOSPA compatibility for extract-utils SHA-1 checked radio rules.
ifndef add-radio-file-sha1-checked
define add-radio-file-sha1-checked
$(if $(filter $(2),$(word 1,$(shell sha1sum $(LOCAL_PATH)/$(1)))),$(call add-radio-file,$(1)),$(error Radio SHA-1 mismatch: $(LOCAL_PATH)/$(1)))
endef
endif


$(call add-radio-file-sha1-checked,radio/abl.img,928888ca99d102d1b94c18a6311360df59669ec9)
$(call add-radio-file-sha1-checked,radio/aop.img,1d0c481b28106faaa27e823b02c4264d5e18d0d8)
$(call add-radio-file-sha1-checked,radio/aop_config.img,d2133284ac22d7069b07917a63a9200ed2e42465)
$(call add-radio-file-sha1-checked,radio/bluetooth.img,333d3802b83b2d117af1cb4abc095572c156dd37)
$(call add-radio-file-sha1-checked,radio/countrycode.img,3bd93f9c0e1d62ced7658b5de803383371f78bc5)
$(call add-radio-file-sha1-checked,radio/cpucp.img,3d93577246c996c1f7333ce40f49354cd0eba84e)
$(call add-radio-file-sha1-checked,radio/cpucp_dtb.img,f3d66d2ca77d64e3861cc5a9500e4641feb529c8)
$(call add-radio-file-sha1-checked,radio/dcp.img,9cc6a54d5a0febadbd5c748d2b52c1cdff09a551)
$(call add-radio-file-sha1-checked,radio/devcfg.img,1c1328d0a7004b9ca1c4f8b5bc986c79664aaff9)
$(call add-radio-file-sha1-checked,radio/dsp.img,db6162141b15f9d24107ef6043a144a42a93f7e8)
$(call add-radio-file-sha1-checked,radio/featenabler.img,a0b8253ba267cac16de103a92ba05635557bc584)
$(call add-radio-file-sha1-checked,radio/hyp.img,eaee340a64c1dd46d0f0d987b0118802a926002c)
$(call add-radio-file-sha1-checked,radio/hyp_ac_config.img,a08f310de9559fd0d0cc0edb2c2a0e1fc669c06c)
$(call add-radio-file-sha1-checked,radio/idmanager.img,cf9908410b6930ea621c6d788c235fca78fb8c51)
$(call add-radio-file-sha1-checked,radio/imagefv.img,cdad6a88e96423639c31828d920c577184f80470)
$(call add-radio-file-sha1-checked,radio/keymaster.img,6dab8fe4903ec20b1624140b94d9c433a07587b0)
$(call add-radio-file-sha1-checked,radio/modem.img,a848ebfb3044a94d397a039a74ebb26a3773b9f5)
$(call add-radio-file-sha1-checked,radio/modemfirmware.img,be4de7efc5f70110fda3510f28909b6755445c03)
$(call add-radio-file-sha1-checked,radio/multiimgqti.img,af86e048aa0949327e933768ab3a0f28fd89779d)
$(call add-radio-file-sha1-checked,radio/pdp.img,0d97b9c2aa1f80d5e3971520c2dd6f48a935e19d)
$(call add-radio-file-sha1-checked,radio/pdp_cdb.img,6795ed5b1e5d468b8426cefd08522ce6767b7b7e)
$(call add-radio-file-sha1-checked,radio/pvmfw.img,4aff23bd08f9f324c2e452082d9381b1002ddb1e)
$(call add-radio-file-sha1-checked,radio/qtvm_dtbo.img,bb08b3f69c2bbefa9a5535692137e005ebc9c9fa)
$(call add-radio-file-sha1-checked,radio/qupfw.img,00807dd24e0ea6672adfa550cb70f080632434fe)
$(call add-radio-file-sha1-checked,radio/secretkeeper.img,43d9f40c7be21038d468daed0bd8a2c7f5133398)
$(call add-radio-file-sha1-checked,radio/shrm.img,0198e6fd0c4dd305eafe2fd56f0b2a3a3291b6e7)
$(call add-radio-file-sha1-checked,radio/soccp.img,967f139b3bfccad114b38c2908099e3274ab6f16)
$(call add-radio-file-sha1-checked,radio/soccp_dcd.img,dfef2c79a5d0ef63ac01c4bce5788f4ceefe79dc)
$(call add-radio-file-sha1-checked,radio/soccp_debug.img,83916e91694d857fa0dbcfe57684fd6abd363aff)
$(call add-radio-file-sha1-checked,radio/spuservice.img,ea9d4e1728fcc706c8ce24d160446b2b975b97a2)
$(call add-radio-file-sha1-checked,radio/tme_config.img,d091a8df332994bfa0ae7624c927d331d31552d0)
$(call add-radio-file-sha1-checked,radio/tme_fw.img,849e5a14f44aa85bc29b7e7a81ff4231d9bfff06)
$(call add-radio-file-sha1-checked,radio/tme_seq_patch.img,cf1e640e4f572a0331f8c8f63fd97bd3f76b7b98)
$(call add-radio-file-sha1-checked,radio/tz.img,3f9b9d999866b9a5522a929909bc0e8d82f2b0de)
$(call add-radio-file-sha1-checked,radio/tz_ac_config.img,cd5e92d0314eaf8d9e478f49bba47c850b5472af)
$(call add-radio-file-sha1-checked,radio/tz_qti_config.img,02b39b8b5eae5eb5d6cf1ac394fa46112da779b5)
$(call add-radio-file-sha1-checked,radio/uefi.img,b61c5da38cef8a20633164c9d6be83e11947c4e0)
$(call add-radio-file-sha1-checked,radio/uefisecapp.img,50f6630fcd42db9a690f1a74e5d6a6b2f1669801)
$(call add-radio-file-sha1-checked,radio/vm-bootsys.img,e03e31bc37691547bbec0768fdd0a259542a296b)
$(call add-radio-file-sha1-checked,radio/xbl.img,3c41ac938db6fe25a7517adabcaf4105412f02c8)
$(call add-radio-file-sha1-checked,radio/xbl_ac_config.img,187c3b428ece5a563c61597c2e37889e31761dd0)
$(call add-radio-file-sha1-checked,radio/xbl_config.img,515c39309e2838e4b3ff381495401e2f0b041850)
$(call add-radio-file-sha1-checked,radio/xbl_ramdump.img,53818ebd7263080896563f0e1d61d3b479c5a845)

endif
