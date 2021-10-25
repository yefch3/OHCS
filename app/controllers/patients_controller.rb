class PatientsController < ApplicationController
    def index
        @user = current_patient
    end  
    def profile
    end    
    def login
    end
end
