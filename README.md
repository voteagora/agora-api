# Agora API

As we explore the future of Agora, this repo is meant to be a test ground for our relationally backed API in REST / GraphQL. This could be where the final API lives... or not, but for now, it will power Agora Next.

## Pre-requisites

To get started, you will need to install Ruby. We recommend using [rbenv](https://github.com/rbenv/rbenv) to manage your ruby versions. You should install `rbenv` via [Homebrew](https://brew.sh/).

### Install Ruby

`$ brew install rbenv`

Install Ruby 3.0.5

`$ rbenv install 3.0.5`

Confirm that you are using the correct version of Ruby.

`$ which ruby`

Should return `~/.rbenv/shims/ruby`

And confirm `$ ruby -v`

Should return: `ruby 3.0.5p211`

### Install Bundler

Bundler is package manager like `yarn` or `npm` but for Ruby.

`$ gem install bundler`

### Install Postgres

There are lots of ways to install Postgres. If you are on a Mac, the easiest way is to install the [Postgres Mac App](https://postgresapp.com/).

### Install the `pg` gem

Installing the Postgres Ruby Gem is tricky because it needs to know where your local Postgres config is located. 

If you installed the Postgress.app from above, you can install the `pg` gem the following way.

`$ gem install pg -- --with-pg-config=/Applications/Postgres.app/Contents/Versions/15/bin/pg_config`


## Getting Started

1. Clone the repo and `cd` into the directory
2. Run `bundle install`
3. Run `rails db:create`
4. Run `rails db:migrate`
5. Run `rails db:seed`

At this point you have a local database with some data in it. You can confirm this by running `rails console` and then `User.all` to see all the users in the database.

If you want to inspect how the data is loaded into the database, you can look at the `db/seeds.rb` file.

## Visualizing the database

If you want to visualize the database, you can use [TablePlus](https://tableplus.com/). You can connect to the database using the local settings and connecting to `agora_api_development`. You can visually explore the seeded data.

## Running the server

To run the server, run `rails server` or `rails s` for short.

## Running tests

Coming soon...

## Deployment

Coming soon...
