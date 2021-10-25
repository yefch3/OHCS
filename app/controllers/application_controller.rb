class ApplicationController < ActionController::Base  
    before_action :configure_permitted_parameters, if: :devise_controller?
    protected

    def configure_permitted_parameters
        devise_parameter_sanitizer.permit(:sign_up, keys: [:email, :username])
    end

    def after_sign_in_path_for(resource)
        if current_patient
            "/patients/#{current_patient.id}/profile" # your path
        elsif current_doctor
            "/doctors/#{current_doctor.id}/profile"
        else
            "/"
        end
    end
end
