2015-07-12 MUIR
----------
- Removed the <link> lines using the CDN bootstrap and now we're using own own local bootstrap code. This comes from a gem called bootstrap-sass.  I've done this so that I can work on the site without an internet connection, and also because we can later remove all the bits of bootstrap that we're not using.  As an added bonus, you can now access Bootstrap mixins and variables inside your code - they are all defined - takea  look at application.scss




2015-07-08 MUIR
----------

- Added a URL for voting a story up or down:  vote_story_path(story, direction: :up) and vote_story_path(story, direction: :down)
- Stories on the index are now sorted by points in descending order.
