# Gambling Legend

Gambling Legend is a platform to bet on random URF matches created for the Riot Games API challenge. Every 10 minutes a
random URF match is chosen and all active bets are evaluated. The odds for the different choices are calculated by
their rate of appearance. Thus you need a basic set of matches to have interesting odds.

You can try all the features as a guest without signing up. It will work the same as an original user except for the
session being deleted when you close the browser. To save your winnings you need to sign up.

## Demo

A demo version of the submitted API challenge entry can be found here: https://gambling-legend.herokuapp.com/

## Preconditions
For Ubuntu/Debian

* Ruby 2: https://rvm.io/rvm/install
* bundler: `sudo gem install bundler`
* `sudo apt-get install postgresql postgresql-client libpq-dev`
* Setup a databse user: https://wiki.debian.org/PostgreSql
* Node.js (optional)

## Setup

    git clone git@github.com:AmShaegar13/gambling_legend.git
    cd gambling_legend

If you don't have node.js you will need to uncomment `therubyracer` in `Gemfile`. Make sure you are not running Ruby 1.9
(`ruby -v`). Use Ruby 2, eg. `rvm use ruby-2.2.2`

    bundle install

Open `config/database.yml` and setup your postgresql connection.

    export PSQL_PASSWORD=yourpassword
    export RIOT_API_KEY=...-...-...-...
    rake db:setup

 Start the server on port 3000:

    rails s -p 3000

You are now running the full application in development mode. To start in production you will need to set
`RAILS_ENV=production` and [precompile assets](http://guides.rubyonrails.org/asset_pipeline.html#precompiling-assets)
first.

## Operation

The Rails environment includes a worker that runs in its own thread and evaluates the bets every 10 minutes.
Alternatively, you can start a daemon with `ruby daemon/bets.rb start` or trigger the evaluation once manually by
running `rake cron:bets`.

## Features

* Bet on random URF matches
* Refill account once per hour if you lost everything
* View your latest bets
* Sign Up to save your progress
* Realistic odds based on actual match stats
* Localization in Englisch and German

### Technical Features

* Securely hashed and salted passwords
* CSRF Protection
* Turbolinks to speed up navigating
* Clean and easy to use Bootstrap layout

## Missing features

Some basic features didn't make it in time into the project but will be added after the challenge. Those are for example:

* Account setting
* Email verification
* Statistics
* Hall of Fame
* FAQ
* Automatic time zone detection
* Automatic language detection
* Automatic tests

## Planned features

Because betting on random matches is quite ... random we have plans to extend the features after the API challenge ends.

* Bet on featured ranked matches
* Bet on arbitrary matches
  * Search for friends' or streamers' matches
* Live odds, depending on current bets
* API?
