# frozen_string_literal: true

class CreateStatistics < ActiveRecord::Migration[5.2]
  def change
    create_table :statistics do |t|
      t.belongs_to :node, foreign_key: true
      t.integer :minimum_value
      t.integer :maximum_value
      t.integer :average_value

      t.timestamps
    end
  end
end
