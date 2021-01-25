class UpdateAnalysis < ActiveRecord::Migration[6.0]
  def change
    add_reference :analyses, :classification, null: true, foreign_key: true, index: true
    add_reference :analyses, :interpretation, null: true, foreign_key: true, index: true
  end
end
