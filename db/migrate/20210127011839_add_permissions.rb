class AddPermissions < ActiveRecord::Migration[6.0]
  def change
    remove_column :observations, :permit_role
    add_column :observations, :permit_level, :integer
    add_column :analyses, :permit_level, :integer
    add_column :users, :permit_level, :integer
  end
end
