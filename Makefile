BASE_NAME := snd-hda-scodec-cs35l41

obj-m := snd-hda-scodec-cs35l41-sandwalker.o
snd-hda-scodec-cs35l41-sandwalker-objs := cs35l41_hda.o cs35l41_hda_property.o

all: modules

clean modules modules_install:
	$(MAKE) -C $(KERNEL_SOURCE_DIR) M=$(PWD) $@

install: modules_install
