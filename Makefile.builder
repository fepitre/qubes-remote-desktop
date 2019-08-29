ifeq ($(PACKAGE_SET),dom0)
RPM_SPEC_FILES := rpm_spec/remote-desktop-dom0.spec
else
RPM_SPEC_FILES := rpm_spec/remote-desktop.spec
DEBIAN_BUILD_DIRS := debian
endif
