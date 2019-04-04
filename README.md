# Readme

This is an MVP app made to query the Github Jobs API and return those results to you.

To start this project up locally, clone the repo and set the database up

`git clone https://github.com/TimBek2/github_api_scraper.git`
`cd github_api_scraper`
`bundle install`
`rails db:create`
`rails db:migrate`
`rails s`

Then navigate your browser to localhost:3000. Go ahead and put a search term and/or location into the search form and you'll be shown the results of your search below!

Every time you search, the results will overwrite on the index page. You can click the "Show Full History" link to see the full list of all the job postings you've gotten through the search engine, and likewise you can click "Clear All Results" to wipe that list out.

Note: Clear All Results is irreversible!

If you click "Read more" from the search results, you can find the link for the job posting on Github Jobs at the bottom of that page.


### Notes for Twine:
With more time, I would have liked to add several features to this app:

- More styling, there is currently an absolute minimum just to break up the monotony of looking at walls of black text
- The ability to delete a single Job listing without clearing out all of them
- I want to add association of Users to Jobs, so that the Devise authentication included actually does something, and also to allow Users to come back to this later and pick up their progress, rather than starting from scratch each time they use to the app.
- I want to add a boolean trait and button to jobs to indicate whether they've been applied to or not, along with a boolean/button to track whether you "like" a job, to save it for later.
- Likewise, I'd like to add a page where a User can see all the jobs they've applied to or liked, in order to keep track of what they've done.
- After thinking about the functionality to track whether jobs have been applied to, I got the idea to actually use the API response data to just print the search results to the page html directly, and then a posting won't be persisted to the database as a Job unless the user has done something to interact with it (something like marking it as "liked" or "applied to" could be two different columns that result in persistence). I'm not sure if this is the best idea to handle this process, but it got into my head and I'll keep thinking about it.
- I'd like to add a "load more" button to load the next page of API responses, although I was rarely able to actually get more than 10 or so reults back from the API when I provided any search terms, so this seems lower priority.
- Deploy to Heroku
