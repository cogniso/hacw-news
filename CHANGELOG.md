2015-07-13 Freddie
----------
- Got rid of underlines on story#show links.
- Changed the HACW comment count color.
- Corrected the brading color variables in application.scss


2015-07-12 MUIR
----------
- Removed the <link> lines using the CDN bootstrap and now we're using own own local bootstrap code. This comes from a gem called bootstrap-sass.  I've done this so that I can work on the site without an internet connection, and also because we can later remove all the bits of bootstrap that we're not using.  As an added bonus, you can now access Bootstrap mixins and variables inside your code - they are all defined - takea  look at application.scss

- Stories have a URL like stories/a-new-car-is-announced which helps us on Google.  This is done using the FriendlyId gem, but you don't need to worry about it.

- A little bit of javascript in the app/assets/javascripts/news/application.js file hides the button for adding a comment on the story page.  It shows the button when a user clicks in (focuses) the text area.  I added a couple of comments to the code.

- I created a helper method in ApplicationHelper for creating a vote link. for a voting link you now call `vote_link_for(object, direction)`.  You'll see this is changed in the views.  This means we only have code in one place for voting now.

- Ajax voting (voting without refreshing the page). I've added a class called js-vote to the voting links.  If I'm using a class for javascript purposes then I'll prefix it with js- so that you know it's not being used for CSS. 



2015-07-08 MUIR
----------

- Added a URL for voting a story up or down:  vote_story_path(story, direction: :up) and vote_story_path(story, direction: :down)
- Stories on the index are now sorted by points in descending order.
