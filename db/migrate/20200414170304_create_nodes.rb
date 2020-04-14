# frozen_string_literal: true

class CreateNodes < ActiveRecord::Migration[5.2]
  def change
    create_table :nodes do |t|
      t.bigint :node_id

      t.timestamps
    end
  end
end
