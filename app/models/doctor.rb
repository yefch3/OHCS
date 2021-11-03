class Doctor < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  validates :username, uniqueness: true, presence: true
end

# class Doctor::ParameterSanitizer < Devise::ParameterSanitizer
#   def initialize(*)
#     super
#     permit(:sign_up, keys: [:username, :email, :last_name, :first_name, :gender])
#   end
# end