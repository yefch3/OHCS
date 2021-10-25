class DoctorsController < ApplicationController
    before_action :authenticate_doctor!
end
