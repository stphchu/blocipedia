class RemoveDefaultFromAmounts < ActiveRecord::Migration[5.2]
  def change
    remove_column :amounts, :default, :integer
  end
end
