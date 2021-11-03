class Message < ApplicationRecord
  belongs_to :room, inverse_of: :messages
  belongs_to :patient
  belongs_to :doctor
  
end
