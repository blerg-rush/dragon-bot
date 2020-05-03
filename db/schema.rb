# frozen_string_literal: true

# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20_200_501_130_651) do
  # These are extensions that must be enabled in order to support this database
  enable_extension 'plpgsql'

  create_table 'accessories', force: :cascade do |t|
    t.string 'name', null: false
    t.boolean 'bandit', default: false
    t.boolean 'empress', default: false
    t.boolean 'oracle', default: false
    t.boolean 'shinobi', default: false
    t.boolean 'warrior', default: false
    t.boolean 'witch', default: false
    t.integer 'level'
    t.integer 'str'
    t.integer 'agi'
    t.integer 'int'
    t.integer 'vit'
    t.integer 'luc'
    t.integer 'pie'
    t.integer 'atk'
    t.integer 'matk'
    t.integer 'def'
    t.integer 'mdef'
    t.integer 'acc'
    t.integer 'macc'
    t.integer 'crt'
    t.text 'bonus', default: [], array: true
  end

  create_table 'weapons', force: :cascade do |t|
    t.string 'name', null: false
    t.string 'type'
    t.boolean 'bandit', default: false
    t.boolean 'empress', default: false
    t.boolean 'oracle', default: false
    t.boolean 'shinobi', default: false
    t.boolean 'warrior', default: false
    t.boolean 'witch', default: false
    t.integer 'level'
    t.integer 'str'
    t.integer 'agi'
    t.integer 'int'
    t.integer 'vit'
    t.integer 'luc'
    t.integer 'pie'
    t.integer 'atk'
    t.integer 'matk'
    t.integer 'def'
    t.integer 'mdef'
    t.integer 'acc'
    t.integer 'macc'
    t.integer 'crt'
    t.string 'element'
    t.text 'bonus', default: [], array: true
  end
end
