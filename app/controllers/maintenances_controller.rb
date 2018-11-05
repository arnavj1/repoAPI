class MaintenancesController < ApplicationController
  # Controller Code

  swagger_controller :maintenances, "Maintenance Management"

  swagger_api :index do
    summary "Fetches all maintenance requests"
    notes "This lists all maintenance requests"
  end

  swagger_api :show do
    summary "Shows one Maintenance request"
    param :path, :id, :integer, :required, "Maintenance ID"
    notes "This lists the details of one Maintenance Request"
    response :not_found
  end

  swagger_api :create do
    summary "Creates a new Maintenance Request"
    param :form, :title, :string, :required, "Title of the request"
    param :form, :description, :string, :required, "Description of the maintenance request"
    param :form, :created_on, :date, :required, "Starting date for a maintenance request"
    param :form, :tenant_id, :integer, :required, "ID of the tenant making the request"
    param :form, :active, :boolean, :required, "Active status of a maintenance request"
    response :not_acceptable
  end

  swagger_api :update do
    summary "Updates an existing Maintenance"
     param :form, :title, :string, "Title of the request"
    param :form, :description, :string, "Description of the maintenance request"
    param :form, :created_on, :date, "Starting date for a maintenance request"
    param :form, :tenant_id, :integer, "ID of the tenant making the request"
    param :form, :active, :boolean, "Active status of a maintenance request"
    response :not_acceptable
  end

  swagger_api :destroy do
    summary "Deletes an existing Maintenance"
    param :path, :id, :integer, :required, "Maintenance ID"
    response :not_found
  end

  before_action :set_maintenance, only: [:show, :update, :destroy]


  def index
    @maintenances = Maintenance.all
    render json: @maintenances
  end


  def show
    render json: @maintenance
  end


  def create
    @maintenance = Maintenance.new(maintenance_params)

    if @maintenance.save
      render json: @maintenace, status: :created, location: @maintenance
    else
      render json: @maintenance.errors, status: :unprocessable_entity
    end
  end


  def update
    if @maintenance.update(maintenance_params)
      render json: @maintenance
    else
      render json: @maintenance.errors, status: :unprocessable_entity
    end
  end


  def destroy
    @maintenance.destroy
  end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_maintenance
      @maintenance = Maintenance.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def maintenance_params
      params.permit(:title, :description, :created_on, :tenant_id, :property_id, :active)
    end
end