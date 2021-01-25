class Observer < ApplicationRecord
  include PublicActivity::Model
  tracked owner: Proc.new{ |controller, model| controller.current_user }

  has_and_belongs_to_many :observations
end
