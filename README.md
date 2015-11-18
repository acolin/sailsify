# Sailsify
Converts rails models and controllers into sailsjs format.

Installation
--------------

In your Gemfile:
```ruby
gem 'sailsify', github: 'acolin/sailsify'
```

To generate your models, controllers run:
```terminal
$ rake sailsify
```
This will create a folder in your rails app root called `sailsify`

To override the destination dir create an initializer at config/sailsify.rb with:
```ruby
Sailsify.config do |c|
  c.destination_dir = '/path/to/dir'
end
```
