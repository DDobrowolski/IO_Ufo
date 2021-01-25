class Observation < ApplicationRecord
  include PublicActivity::Model
  tracked owner: Proc.new{ |controller, model| controller.current_user }

  has_many :analyses
  has_and_belongs_to_many :observers
end
