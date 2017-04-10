### PUT HERE YOUR PLANTUML FILE PATH ###
plantumlpath := "D:\Apps\plantuml.jar"
###

plants := $(wildcard uml/process/*.plantuml)
images := $(subst plantuml,png, $(plants))


ifeq ($(OS),Windows_NT)
#os is windows
dir := $(shell cd)
RM_COMMAND := rmdir /S /Q

else
# OS is unix
dir := $(shell pwd)
RM_COMMAND := rm -rf
endif

foo : $(images)

%.png : %.plantuml
	java -jar $(plantumlpath) -o $(dir)/bin/$(dir $@) $<

PHONY: mrproper
mrproper :
	$(RM_COMMAND) bin

PHONY: debug
debug :
	$(info $$images is [${images}])
	$(info $$dir is [${dir}])