class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, 
         :recoverable, :rememberable, :validatable, :encryptable, :registerable
  include PublicActivity::Model
  tracked owner: Proc.new{ |controller, model| controller ? controller.current_user : nil }
  has_many :analysises

  ROLES = %i[admin data_admin analyst reader]

  def self.get_available_roles
      ROLES
  end
end
