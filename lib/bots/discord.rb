# frozen_string_literal: true

require 'dotenv/load' unless ENV['RUBY_ENV'] == 'production'
require 'discordrb'
require './lib/models/weapon'
require './lib/models/accessory'
require './lib/helpers/format'

class DiscordBot < Discordrb::Commands::CommandBot
  def initialize
    super(token: ENV['DISCORD_TOKEN'], prefix: '!')
  end

  def run
    puts "This bot's invite URL is #{invite_url}."
    puts 'Click on it to invite it to your server.'

    initialize_commands
    super.run
  end

  def initialize_commands
    help_command
    weapon_command
    accessory_command
  end

  def help_command
    command :help do |event|
      event << 'Supported commands:'
      event << '!weapon <name>'
      event << '!accessory <name>'
    end
  end

  def weapon_command
    command :weapon do |event, *args|
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
    command :accessory do |event, *args|
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
