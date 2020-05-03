# frozen_string_literal: true

require 'dotenv/load'
require 'discordrb'
require 'active_record'
require './lib/models/weapon'
require './lib/models/accessory'

def db_configuration
  db_configuration_file = File.join(File.expand_path(__dir__),
                                    '..',
                                    'db',
                                    'config.yml')
  YAML.safe_load(File.read(db_configuration_file), aliases: true)
end

ActiveRecord::Base.establish_connection(db_configuration[ENV['RUBY_ENV']])

bot = Discordrb::Commands::CommandBot.new token: ENV['DISCORD_TOKEN'],
                                          prefix: '!'

puts "This bot's invite URL is #{bot.invite_url}."
puts 'Click on it to invite it to your server.'

bot.command :help do |event|
  event << 'Supported commands:'
  event << '!weapon <name>'
  event << '!accessory <name>'
end

bot.command :weapon do |event, *args|
  if args.nil?
    return "Usage: \"!weapon <name>\"\nFor example: \"!weapon Knife +2\""
  end

  input = args.join(' ').downcase
  weapon = Weapon.find_by_name(input)
  return "#{input.capitalize} not found" if weapon.nil?

  event << "**#{input.capitalize}**"
  event << "Required level: #{weapon.level}"
  event << weapon.stats
  event << 'Bonuses:'
  weapon.bonuses.each { |bonus| event << bonus }
  nil
end

bot.command :accessory do |event, *args|
  if args.nil?
    return "Usage: \"!accessory <name>\"\nFor example: \"!weapon Knife +2\""
  end

  input = args.join(' ').downcase
  accessory = Accessory.find_by_name(input)
  return "#{input.capitalize} not found" if accessory.nil?

  event << "**#{input.capitalize}**"
  event << "Required level: #{accessory.level}"
  event << accessory.stats
  event << 'Bonuses:'
  accessory.bonuses.each { |bonus| event << bonus }
  nil
end

bot.run
