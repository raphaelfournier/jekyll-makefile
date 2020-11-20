# jekyll-makefile

I like to automate writing posts with Jekyll. However, I had some troubles with
Rakefiles, often proposed as the solution (see
https://github.com/avillafiorita/jekyll-rakefile for instance). 

I wanted a Makefile to contain the template of a post (jekyll metadata), fill a
few variables (title, date), create the file and launch vim.

I may now use:
    
    make post TITLE="Foo Bar"
    
to create automatically `./_posts/blog/2020-11-20-foo-bar.md` and edit it.
Afterwards, I use:

    make html upload
    
to compile the site and upload it (upload.sh not provided here).

Obtaining the Makefile was a bit tricky, since it uses a clearly discouraged
syntax for Makefiles. 

StackOverflow answers https://stackoverflow.com/a/6782328/14450207 and
https://stackoverflow.com/a/36148655/14450207 about Heredoc (Here documents)
were very helpful. I had to combine them, the first was OK but the "---" lines
were not displayed (probably a "POSIX special characters"-problem).

The Makefile also contain a rule to create "news" (a special kind of post on my website). The date variable format should be changed according to your preferences. 

Hope this will help someone, someday :-)
