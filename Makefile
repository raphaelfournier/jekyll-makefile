SHELL=bash
.ONESHELL:
TITRE=$(shell echo ${TITLE} | tr '[:upper:]' '[:lower:]' | tr " " "-" | tr -s "-")
DATE=$(shell date +'%Y-%m-%d')
NEWSNAME=$(shell echo ./_posts/news/${DATE}-${TITRE}.md)
FILENAME=$(shell echo ./_posts/blog/${DATE}-${TITRE}.md)

.news = \
---\n\
title: "${TITRE}"\n\
date: "${DATE}"\n\
layout: post\n\
place : \n\
eventdate :\n\
categories: \n\
- news\n\
locale: fr\n\
tags:\n\
---\n\
\n\
#
.post = \
---\n\
title: "${TITRE}"\n\
date: "${DATE}"\n\
layout: post\n\
locale: fr\n\
tags:\n\
---\n\
\n\
#
post:
	echo -e "$(.$(@))" | sed -e 's/^[ ]//' > $(FILENAME)
	vim $(FILENAME) +

news:
	echo -e "$(.$(@))" | sed -e 's/^[ ]//' > $(NEWSNAME)
	vim $(NEWSNAME) +

html:
	bundle exec jekyll build

clean:
	rm -rf _site/*

upload:
	echo "uploading..."
	./upload.sh

