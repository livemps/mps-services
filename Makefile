# Makefile Setup
.PHONY: default all build up down restart exec purge
default:all
all: build up

# Makefile config
TARGETS := swag vpn mumble portainer nextcloud mailu gitlab

define dojobs
  for t in $(TARGETS) ; do  make -C docker/$$t/ $(1) ; done 
endef

# Compose targets
install:
	$(call dojobs,build)
check:
	$(call dojobs,check)
persist: 
	cp snippets/dockcon ~/snippets/dockcon

