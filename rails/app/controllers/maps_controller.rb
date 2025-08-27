class MapsController < ApplicationController
  def point
    # Get the model class from the parameter
    model_class = params[:model].constantize
    
    # Find the specific record
    @record = model_class.find(params[:id])
    
    # Render the appropriate partial based on the model name
    render partial: "maps/#{params[:model].underscore}", object: @record
  end
end
