class CreateWeapons < ActiveRecord::Migration[5.2]
  def change
    create_table :weapons do |t|
      t.string :name, null: false
      t.string :type
      t.boolean :bandit, default: false
      t.boolean :empress, default: false
      t.boolean :oracle, default: false
      t.boolean :shinobi, default: false
      t.boolean :warrior, default: false
      t.boolean :witch, default: false
      t.integer :level
      t.integer :str
      t.integer :agi
      t.integer :int
      t.integer :vit
      t.integer :luc
      t.integer :pie
      t.integer :atk
      t.integer :matk
      t.integer :def
      t.integer :mdef
      t.integer :acc
      t.integer :macc
      t.integer :crt
      t.string :element
      t.text :bonus, array: true, default: []
    end
  end
end
