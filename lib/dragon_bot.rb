# frozen_string_literal: true

require 'dotenv/load' unless ENV['RUBY_ENV'] == 'production'
require 'discordrb'
require 'active_record'
require './lib/models/weapon'
require './lib/models/accessory'
require './lib/helpers/format'
require 'erb'

def db_configuration
  db_configuration_file = File.join(File.expand_path(__dir__),
                                    '..',
                                    'db',
                                    'config.yml')
  YAML.safe_load(ERB.new(File.read(db_configuration_file)).result,
                 aliases: true)
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
  if args.empty?
    return 'Usage: "!weapon <name>"'\
           "\nExample: !weapon knife +2"
  end

  input = args.join(' ').downcase
  weapon = Weapon.find_by_name(input)
  return "#{Format.title(input)} not found" if weapon.nil?

  Format.equip_info(weapon).each { |line| event << line }
  nil
end

bot.command :accessory do |event, *args|
  if args.empty?
    return 'Usage: "!accessory <name>"'\
           "\nExample: !accessory dragon king crystal"
  end

  input = args.join(' ').downcase
  accessory = Accessory.find_by_name(input)
  return "#{input.capitalize} not found" if accessory.nil?

  Format.equip_info(accessory).each { |line| event << line }
  nil
end

bot.run
