class CreateInterpretations < ActiveRecord::Migration[6.0]
  def change
    create_table :interpretations do |t|
      t.string :name

      t.timestamps
    end
  end
end
