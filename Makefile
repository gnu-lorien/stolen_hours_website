DISCIPLINES=$(shell ls disciplines/*.t2t)
SRCS=$(shell ls *.t2t)
OBJS=$(SRCS:.t2t=.html)
TEMPLATES=post_main_content.html \
		pre_main_content.html

%.html: %.t2t $(TEMPLATES)
	echo `date`\;$< >> updates
	txt2tags --mask-email --css-sugar -H -o $@ $<

all: $(OBJS)

disciplines.html: disciplines.t2t $(DISCIPLINES)

upload:
	echo `date`\;upload >> updates

clean:
	rm $(OBJS)
