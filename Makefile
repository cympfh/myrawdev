%:
	if [ -f $@.jpg.pp3 ]; then \
		rawtherapee-cli -Y -p $@.jpg.pp3 -c $@.RAF ;\
	else \
		rawtherapee-cli -Y -O ./ -p profiles/mydefault.pp3 -c $@.RAF ;\
	fi

%.water.jpg: %.jpg
	$(eval MODEL := $(shell identify -format "%[EXIF:Make] %[EXIF:Model]" $<))
	$(eval F := $(shell identify -format "%[EXIF:FNumber]" $< | sed 's/.*/awk "BEGIN{print &}"/e'))
	$(eval SS := $(shell identify -format "%[EXIF:ExposureTime]" $< | sed 's#.*#awk "BEGIN{print 1/(&)}"#e'))
	$(eval ISO := $(shell identify -format "%[EXIF:PhotographicSensitivity]" $< ))
	$(eval DATETIME := $(shell identify -format "%[EXIF:DateTime]" $< ))
	$(eval ANNO := "$(MODEL), f/$(F) 1/$(SS)s ISO$(ISO), $(DATETIME), Photo by @YameGuri")
	$(eval WEIGHT := $(shell identify -format '%w' $< ))
	convert -background '#0005' -fill '#fff6' -gravity West -font "Consolas" -pointsize 13 -size $(WEIGHT)x caption:$(ANNO) DSCF3589.jpg +swap -gravity SouthWest -composite $@
