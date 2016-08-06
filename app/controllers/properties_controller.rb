class PropertiesController < ApplicationController
  before_action :set_property, only: [:show, :edit, :update, :destroy]

  def index
	@q = Property.ransack(params[:q])
    @properties = @q.result.order("created_at DESC").page(params[:page]).per(8)
  end

  def show
  end

  def new
    @property = Property.new
	@location = Location.all
	@bedroom = Bedroom.all
  end

  def edit
  end

  def create
    @property = Property.new(property_params)
	if @property.save
	  redirect_to @property, notice: "Property was Successfully created!"
	else
	  render 'new'
	end
  end

  def update
    respond_to do |format|
      if @property.update(property_params)
        format.html { redirect_to @property, notice: 'Property was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  def destroy
    @property.destroy
    respond_to do |format|
      format.html { redirect_to properties_url, notice: 'Property was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    def set_property
      @property = Property.find(params[:id])
    end

    def property_params
      params.require(:property).permit(:title, :image, :size, :bedroom_id, :location_id, :description)
    end
end
