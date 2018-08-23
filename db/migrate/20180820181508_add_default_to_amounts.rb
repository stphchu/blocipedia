class AddDefaultToAmounts < ActiveRecord::Migration[5.2]
  def change
    add_column :amounts, :default, :integer
  end
end
