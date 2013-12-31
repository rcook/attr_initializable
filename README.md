# `attr_initializable`

[![Install gem](https://badge.fury.io/rb/attr_initializable.png)](https://rubygems.org/gems/attr_initializable)
[![Build status](https://travis-ci.org/rcook/attr_initializable.png)](https://travis-ci.org/rcook/attr_initializable)
[![Coverage status](https://coveralls.io/repos/rcook/attr_initializable/badge.png?branch=master)](https://coveralls.io/r/rcook/attr_initializable)

Rails plugin that provides `attr_initializable` helper to declare read-only attributes that can be mass-assigned at model creation time

# Active Record support

`attr_initializable` Works with Active Record 3.2.x natively and Active Record 4.0.x with
the `protected_attributes` compatibility gem and is tested against Ruby versions 1.9.3,
2.0.0 and 2.1.0.

# Installation

Add `gem 'attr_initializable'` to your Rails' `Gemfile` and run `bundle install`.


# Contributing

See [`.travis.yml`](https://github.com/rcook/attr_initializable/blob/master/.travis.yml)
for details of the commands that are run as part of the Travis-CI build of this project.
The minimum bar for all push requests is that the Travis-CI build must pass. Please also
consider adding new tests to cover any new functionality introduced into the project.

To manually run the Travis-CI verification steps on your local machine, you can use the
following sequence of commands:

```bash
# To test against Active Record 3.2.x
BUNDLE_GEMFILE=Gemfile.rails3 bundle exec rake
# To test against Active Record 4.0.x
BUNDLE_GEMFILE=Gemfile.rails4 bundle exec rake
# Build the gem
gem build attr_initializable.gemspec
```

# Licence

`attr_initializable` is released under the MIT licence.

