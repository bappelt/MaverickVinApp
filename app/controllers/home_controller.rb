class HomeController < ApplicationController

  def index

  end

  def decode_vin
    @vehicle = Vehicle.new( :vin => params[:vin] )

    respond_to do |format|
      format.js
    end
  end


end
