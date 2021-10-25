class Message < ApplicationRecord
  belongs_to :room
  belongs_to :patient
  belongs_to :doctor
  inverse_of: :messages
end
