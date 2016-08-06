class BedroomsController < ApplicationController
  before_action :set_bedroom, only: [:show, :edit, :update, :destroy]
  
  def index
    @bedrooms = Bedroom.all
  end

  def show
  @title = @bedroom.name
  @properties = @bedroom.properties
  end

  private
    def set_bedroom
      @bedroom = Bedroom.find(params[:id])
    end

    def bedroom_params
      params.require(:bedroom).permit(:name)
    end
end
