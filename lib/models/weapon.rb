# frozen_string_literal: true

class Weapon < ActiveRecord::Base
  validates :name, presence: true, uniqueness: { case_insensitive: true }

  def stats
    list = slice(:str, :agi, :int, :vit, :luc, :pie, :atk,
                 :matk, :def, :mdef, :acc, :macc, :crt)
    list.reduce('') do |acc, (stat, value)|
      next acc if value.nil?

      acc + "#{stat.upcase}: #{value}\t"
    end.strip
  end

  def classes
    list = slice(:bandit, :empress, :oracle,
                 :shinobi, :warrior, :witch)
    return 'All' if list.values.all?

    list.reduce('') do |acc, (class_name, bool)|
      next acc unless bool

      acc + "#{class_name.capitalize} "
    end.strip
  end
end
