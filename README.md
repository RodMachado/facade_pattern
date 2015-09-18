Facade Pattern
==============

[![Build Status](https://semaphoreci.com/api/v1/projects/a96a026b-fbd2-4dd4-911e-37804816ecf4/544780/shields_badge.svg)](https://semaphoreci.com/rodmac98/facade_pattern)
[![Code Climate](https://codeclimate.com/github/RodMachado/facade_pattern/badges/gpa.svg)](https://codeclimate.com/github/RodMachado/facade_pattern)
[![Test Coverage](https://codeclimate.com/github/RodMachado/facade_pattern/badges/coverage.svg)](https://codeclimate.com/github/RodMachado/facade_pattern/coverage)

This is a proof of concept of the use of a Facade Pattern as a solution to
the ever growing problem of too many object instantiations in larger rails
application controllers.

It is also an exercise on the use of other service objects to better identify
responsabilities inside the domain layer.

Some objectives of this exercise are:
- Instantiate only one object in controller actions (https://robots.thoughtbot.com/sandi-metz-rules-for-developers)
- Avoid creating a 'GOD' object
- Better test coverage
- Make a better separation between model-domain-presentation layers

This is a work in progress. Feel free to add suggestions.

