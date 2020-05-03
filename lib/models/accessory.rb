# frozen_string_literal: true

require './lib/helpers/equipment'

class Accessory < ActiveRecord::Base
  include Equipment
  validates :name, presence: true, uniqueness: { case_insensitive: true }
end
