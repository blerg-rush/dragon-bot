# frozen_string_literal: true

require 'dotenv/load' unless ENV['RUBY_ENV'] == 'production'
require 'active_record'
require 'erb'
require 'discordrb'
require 'slack-ruby-bot'
require './lib/bots/discord'
require './lib/bots/slack'
require './lib/helpers/format'
require './lib/models/weapon'
require './lib/models/accessory'

def db_configuration
  db_configuration_file = File.join(File.expand_path(__dir__),
                                    '..',
                                    'db',
                                    'config.yml')
  YAML.safe_load(ERB.new(File.read(db_configuration_file)).result,
                 aliases: true)
end

ActiveRecord::Base.establish_connection(db_configuration[ENV['RUBY_ENV']])

# Uncomment these to run in Discord mode
# discord_bot = DiscordBot.new
# discord_bot.run

# Uncomment the below to run in Slack mode
# SlackBot.run
