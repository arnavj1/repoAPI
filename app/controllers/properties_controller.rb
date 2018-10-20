class PropertiesController < ApplicationController
  # Controller Code

  before_action :set_property, only: [:show, :update, :destroy]


  def index
    @properties = Property.all
    render json: @properties
  end


  def show
    render json: @property
  end


  def create
    @property = Property.new(property_params)

    if @property.save
      render json: @property, status: :created, location: @property
    else
      render json: @property.errors, status: :unprocessable_entity
    end
  end


  def update
    if @property.update(property_params)
      render json: @property
    else
      render json: @property.errors, status: :unprocessable_entity
    end
  end


  def destroy
    @property.destroy
  end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_property
      @property = Property.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def property_params
      params.permit(:addr_line1, :city, :state, :zip)
    end
end