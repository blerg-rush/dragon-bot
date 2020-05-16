# dragon-bot
Discord and Slack bot for Dragon Marked For Death info

## Requirements

* Ruby 2.7.1
* Postgresql (version 12, if using the supplied dragon_bot_db_dump.tar)

## Quick Start
If you just want to run the app as is, all you need to do is:

* Install the gems (`$ bundle install`)
* Add the database
  * `$ sudo -u postgres -i` (start terminal session as 'postgres' user)
  * `$ psql`
  * `postgres=# CREATE DATABASE dragon_bot_development;`
  * `postgres=# \q` (quit psql)
  * `$ exit` (quit 'postgres' user session)
* Restore the database backup
  * navigate to dragon-bot/db
  * `$ pg_restore -d dragon_bot_development dragon_bot_dump.tar`
* Create a `.env` file as shown in `.env.example`, including your own [Discord](https://discord.com/developers/docs/intro) or [Slack](https://api.slack.com/start) API key
* Uncomment the appropriate lines in `lib/dragon_bot.rb` to enable either Discord or Slack
* run `$rake` and invite the bot to your channel!