Facade Pattern

This is a proof of concept of the use of a Facade Pattern as a solution to
ever growing problem of too many object instantiations in controllers of
larger rails applications.

It is also an exercise on the use of other service objects to better identify
responsabilities inside the domain layer.

Some objectives of this exercise are:
- Instantiate only one object in controller actions (https://robots.thoughtbot.com/sandi-metz-rules-for-developers)
- Avoid creating a 'GOD' object
- Facilitade the writing of tests
- Make a better separation between model-domain-presentation layers

This is a work in progress. Feel free to add suggestions.