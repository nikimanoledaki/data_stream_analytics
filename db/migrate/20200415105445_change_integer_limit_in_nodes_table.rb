class ChangeIntegerLimitInNodesTable < ActiveRecord::Migration[5.2]
  def change
    change_column :nodes, :node_id, :bigint
  end
end
