class PatientsController < ApplicationController
    before_action :authenticate_patients!    
end
