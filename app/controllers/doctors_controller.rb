class DoctorsController < ApplicationController
    before_action :authenticate_doctor!
    def profile
        if doctor_signed_in?
            @doctor = current_doctor
        end
    end

    def index
        @doctors = Doctor.all
    end
    
    def editinfo
        @doctor = current_doctor
    end

    def update
        @doctor = current_doctor
        @doctor.update(update_params)
        flash[:notice] = "#{@doctor.username} profile was successfully updated."
        redirect_to "/doctors/#{@doctor.id}/profile"
    end
    

    private
    # Making "internal" methods private is not required, but is a common practice.
    # This helps make clear which methods respond to requests, and which ones do not.
    def update_params
      params.require(:doctor).permit(:last_name, :first_name, :gender, :birthday)
    end
    
end
