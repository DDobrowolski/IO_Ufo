class CreateObservers < ActiveRecord::Migration[6.0]
  def change
    create_table :observers do |t|
      t.string :last_name
      t.string :first_name
      t.string :nick
      t.string :address
      t.string :contact
      t.string :photo
      t.text :description

      t.timestamps
    end
  end
end
