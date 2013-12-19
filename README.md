# `attr_initializable`

[![Install gem](https://badge.fury.io/rb/attr_initializable.png)](https://rubygems.org/gems/attr_initializable)
[![Build status](https://travis-ci.org/rcook/attr_initializable.png)](https://travis-ci.org/rcook/attr_initializable)
[![Coverage status](https://coveralls.io/repos/rcook/attr_initializable/badge.png?branch=master)](https://coveralls.io/r/rcook/attr_initializable)

Rails plugin that provides `attr_initializable` helper to declare read-only attributes that can be mass-assigned at model creation time

# Active Record support

Works with Active Record 3.2.x natively and Active Record 4.0.x with `protected_attributes` compatibility gem.

# Installation

Add `gem 'attr_initializable'` to your Rails' `Gemfile` and run `bundle install`.

# Development notes

## Running tests

To run tests under Active Record 3.2.x:

```bash
BUNDLE_GEMFILE=Gemfile.rails3 rake
```

To run tests under Active Record 4.0.x:

```bash
BUNDLE_GEMFILE=Gemfile.rails4 rake
```

# Licence

`attr_initializable` is released under the MIT licence.

