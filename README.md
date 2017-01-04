jekyll-no-matter
================

this is a [jekyll](https://jekyllrb.com) plugin to allow files with certain
extensions to be converted even without front matter

### step 1

install the plug through one of the ways mentioned at
https://jekyllrb.com/docs/plugins/#installing-a-plugin

### step 2

add a `no_matter` array to your site's `_config.yml`

```yml
# sass and Markdown don't matter
no_matter:
	- .sass
	- .scss
	- .md
```

### step 3

if you're using sass `@include` set the load paths in your site's `_config.yml`

```yml
sass:
  load_paths:
		- _sass
```
