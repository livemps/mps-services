
# Makefile Setup
MAKEFLAGS += --no-print-directory
.PHONY: default all build up down restart exec check ps purge
default:all
all: build up

# Makefile config
TARGETS := swag vpn mumble portainer nextcloud mailu gitlab

define dojobs
  @for t in $(TARGETS) ; do  make -C $$t/ $(1) ; echo "" ; done 
endef

# Compose targets
build:
	$(call dojobs,$@)
up: 
	$(call dojobs,$@)
down:
	$(call dojobs,$@)
restart:
	$(call dojobs,$@)
logs:
	$(call dojobs,$@)
exec:
	$(call dojobs,$@)
check:
	$(call dojobs,$@)
ps:
	$(call dojobs,$@)
purge:
	$(call dojobs,$@)
