class CreateObservations < ActiveRecord::Migration[6.0]
  def change
    create_table :observations do |t|
      t.date :occured_at
      t.string :gps
      t.text :description
      t.string :directory_name
      t.string :permit_role

      t.timestamps
    end
  end
end
