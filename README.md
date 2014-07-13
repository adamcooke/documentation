# Documentation

Documentation is a Rails engine which provides a complete system for managing a set of hierarchical documentation. Once installed in an application, you'll have a complete user interface for viewing as well as editing a set of markdown pages.

![Screenshot](http://s.adamcooke.io/14/VGaMe.png)

## Installation

To get started, you need to add Documentation to your Gemfile and run `bundle`.

```ruby
gem 'documentation', '~> 1.0.0'
```

Next, you'll need to run the setup generator which will add a route to your `config/routes.rb` file for the Documentation interface.

```
bundle exec rails generate documentation:setup
```

You now need to populate your database schema and load the initial documentation pages.

```
bundle exec rake db:migrate documentation:install_guides
```

Once this is done, you can go ahead and start up your Rails application and browse to `/docs` to view your documentation system.
