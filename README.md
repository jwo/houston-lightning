Houston Lightning Talks
=======================

An AngularJS + Rails application for lightning talks

The Stack
-----------

0. rails-api (4.0)
0. Ruby 2.0
0. Puma
0. Postgres
0. AngularJS

Deploying
---------------

Easiest to deploy to heroku, but anything will do. With heroku, look at the
.env.sample and get values for those.

0. Run `rake secret` for the `SECRET_KEY_BASE`
0. Get the pusher url and pusher id from a http://pusherapp.com account. (free
   exists)


Getting Started Developing
-------------------------

0. copy config/database.yml.sample to config/database.yml and fill in the
   username and password
0. copy .env.sample to .env and fill in values

Contributing
------------

Awesome! Standard GitHub pull requests. I look for code that:

* Improves the system
* Simplifies the system

License
-------

MIT license. Copyright 2013 Jesse Wolgamott
