# frozen_string_literal: true

require 'dotenv/load' unless ENV['RUBY_ENV'] == 'production'
require 'discordrb'
require './lib/models/weapon'
require './lib/models/accessory'
require './lib/helpers/format'

class DiscordBot
  def initialize(token:, prefix:)
    @bot = Discordrb::Commands::CommandBot.new token: token,
                                               prefix: prefix

    puts "This bot's invite URL is #{@bot.invite_url}."
    puts 'Click on it to invite it to your server.'

    initialize_commands
    @bot.run
  end

  def initialize_commands
    help_command
    weapon_command
    accessory_command
  end

  def help_command
    @bot.command :help do |event|
      event << 'Supported commands:'
      event << '!weapon <name>'
      event << '!accessory <name>'
    end
  end

  def weapon_command
    @bot.command :weapon do |event, *args|
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
  end

  def accessory_command
    @bot.command :accessory do |event, *args|
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
  end
end
