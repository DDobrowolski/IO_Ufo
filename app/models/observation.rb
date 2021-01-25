class Observation < ApplicationRecord
  has_many :analyses
  include PublicActivity::Model
  tracked owner: Proc.new{ |controller, model| controller.current_user }
end
