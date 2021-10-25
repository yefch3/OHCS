class RoomsController < ApplicationController
    def index
        @rooms = Room.all
    end
    def dashboard
        @rooms = Room.all
    end
end
