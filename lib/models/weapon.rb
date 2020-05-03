# frozen_string_literal: true

require './lib/helpers/equipment'

class Weapon < ActiveRecord::Base
  include Equipment
  validates :name, presence: true, uniqueness: { case_insensitive: true }
end
