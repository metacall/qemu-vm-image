
.PHONY: all kernel init base_image metacall_image clear test default help

# Default target
default: all

# All targets
all:
	@$(MAKE) clear
	@$(MAKE) kernel


# Show help
help:
	@echo 'Management commands for metacall-vm image:'
	@echo
	@echo 'Usage:'
	@echo '    make kernel         Build linux kernel'
	@echo '    make base_image     Builds os image with kernel, init, but without metacall distributable'
	@echo '    make metacall_image Builds os image.'
	@echo '    make init           Download and build init'
	@echo '    make build          Build the VM disk image for all platforms'
	@echo '    make test           Run integration tests for the already built VM disk images.'
	@echo '    make clear          Clear all containers and images.'
	@echo '    make help           Show verbose help.'
	@echo

# Build linux kernel
kernel:
	$(shell ./scripts/build_kernel.sh)
	@echo "Done"