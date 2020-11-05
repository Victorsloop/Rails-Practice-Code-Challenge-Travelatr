class DestinationsController < ApplicationController 
    def index 
        @destination = Destination.all 
    end 

    def show 
        @destination = Destination.find(params[:id])
    end 
end 