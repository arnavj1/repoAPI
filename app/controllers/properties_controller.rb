class PropertiesController < ApplicationController
  # Controller Code
  swagger_controller :properties, "Property Management"

  swagger_api :index do
    summary "Fetches all Properties"
    notes "This lists all Properties"
  end

  swagger_api :show do
    summary "Shows one Property"
    param :path, :id, :integer, :required, "Property ID"
    notes "This lists the details of one property"
    response :not_found
  end

  swagger_api :create do
    summary "Creates a new Property"
    param :form, :addr_line1, :string, :required, "First address line"
    param :form, :city, :string, :required, "Property's City"
    param :form, :state, :string, :required, "Property's State"
    param :form, :zipcode, :string, :required, "Property's zipcode"
    param :form, :rent, :integer, :required, "Lease's rent, frequency depending on property"
    param :form, :start_date, :date, :required, "Start date of lease"
    param :form, :active, :boolean, :required, "Active status of a Property"
    response :not_acceptable
  end

  swagger_api :update do
    summary "Updates a new Property"
    param :form, :addr_line1, :string, "First address line"
    param :form, :city, :string, "Property's City"
    param :form, :state, :string, "Property's State"
    param :form, :zipcode, :string, "Property's zipcode"
    param :form, :rent, :integer, "Lease's rent, frequency depending on property"
    param :form, :start_date, :date, "Start date of lease"
    param :form, :active, :boolean, "Active status of a Property"
    response :not_acceptable
  end

  swagger_api :destroy do
    summary "Deletes an existing Property"
    param :path, :id, :integer, :required, "Property ID"
    response :not_found
  end

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
      params.permit(:addr_line1, :city, :state, :zipcode, :rent, :start_date, :landlord_id, :active)
    end
end