# frozen_string_literal: true

# Rakefile
#
require 'standalone_migrations'
StandaloneMigrations::Tasks.load_tasks

bot = Discordrb::Commands::CommandBot.new token: ENV['BOT_TOKEN'], prefix: '!'

puts "This bot's invite URL is #{bot.invite_url}."
puts 'Click on it to invite it to your server.'
