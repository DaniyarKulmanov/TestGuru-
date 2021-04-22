# frozen_string_literal: true

class CreateTests < ActiveRecord::Migration[6.1]
  def change
    create_table :tests do |t|
      t.string :title, null: false
      t.integer :level, default: 0
      t.references :author, null: false, foreign_key: { to_table: :users }

      t.timestamps
    end
  end
end
