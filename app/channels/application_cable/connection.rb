module ApplicationCable
  class Connection < ActionCable::Connection::Base
    identified_by :current_patient

    def connect
      self.current_user = find_verified_user
    end

    private

    def find_verified_user
      if verified_user = Patient.find_by(id: cookies.signed['patient.id'])
        verified_user
      else
        reject_unauthorized_connection
      end
    end
  end
end