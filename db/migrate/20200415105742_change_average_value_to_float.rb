class ChangeAverageValueToFloat < ActiveRecord::Migration[5.2]
  def change
    change_column :statistics, :average_value, :float
  end
end
