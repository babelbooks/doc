### PUT HERE YOUR PLANTUML FILE PATH ###
plantumlpath := "D:\Apps\plantuml.jar"
###

ifeq ($(OS),Windows_NT)
#os is windows
dir := $(shell cd)
RM_COMMAND := rmdir /S /Q

else
# OS is unix
dir := $(shell pwd)
RM_COMMAND := rm -rf
endif

output_dir = $(dir)/bin/

plants := $(wildcard uml/process/*.plantuml)
images := $(subst plantuml,png, $(plants))
images := $(foreach images_tmp,$(images),$(output_dir)$(images_tmp))



foo : $(images)

$(output_dir)%.png : %.plantuml
	java -jar $(plantumlpath) -o $(dir $@) $<

PHONY: mrproper
mrproper :
	$(RM_COMMAND) bin

PHONY: debug
debug :
	$(info $$images is [${images}])
	$(info $$dir is [${dir}])