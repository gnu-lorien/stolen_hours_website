DISCIPLINES=$(shell ls disciplines/*.t2t)
SRCS=$(shell ls *.t2t atlanta_event_2010/*.t2t georgia_gala_2012/*.t2t)
OBJS=$(SRCS:.t2t=.html)
TXT2TAGS=$(CURDIR)/txt2tags
TEMPLATES=post_main_content.html \
		pre_main_content.html \
		atlanta_event_2010/post_main_content.html \
		atlanta_event_2010/pre_main_content.html \
		atlanta_event_2010/emails.header \
		georgia_gala_2012/post_main_content.html \
		georgia_gala_2012/pre_main_content.html \
		georgia_gala_2012/emails.header \
		georgia_gala_2012/paypalbutton.html

%.html: %.t2t $(TEMPLATES)
	echo `date`\;$< >> updates
	$(TXT2TAGS) --mask-email --css-sugar -H -o $@ $<

all: $(OBJS)

georgia_gala_2012/pay.html: georgia_gala_2012/pay.t2t $(TEMPLATES) georgia_gala_2012/payment_information_text.t2ti
	echo `date`\;$< >> updates
	$(TXT2TAGS) --mask-email --css-sugar -H -o $@ $<

disciplines.html: disciplines.t2t $(DISCIPLINES)

upload:
	echo `date`\;upload >> updates

clean:
	rm $(OBJS)
