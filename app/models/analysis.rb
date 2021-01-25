class Analysis < ApplicationRecord
  include PublicActivity::Model
  tracked owner: Proc.new{ |controller, model| controller.current_user }
  belongs_to :user
  belongs_to :observation
  belongs_to :classification
  belongs_to :interpretation
end
