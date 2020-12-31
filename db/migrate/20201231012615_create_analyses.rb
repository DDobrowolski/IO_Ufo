class CreateAnalyses < ActiveRecord::Migration[6.0]
  def change
    create_table :analyses do |t|
      t.text :description
      t.text :conclusions
      t.string :classification
      t.string :interpretation
      t.references :user, null: false, foreign_key: true
      t.references :observation, null: false, foreign_key: true

      t.timestamps
    end
  end
end
