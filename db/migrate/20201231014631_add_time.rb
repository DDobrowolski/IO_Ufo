class AddTime < ActiveRecord::Migration[6.0]
  def change
    remove_column :observations, :occured_at
    add_column :observations, :occurred_at, :timestamp
  end
end
