class CreateObservationsObserversJoinTable < ActiveRecord::Migration[6.0]
  def change
    create_join_table :observations, :observers
  end
end
