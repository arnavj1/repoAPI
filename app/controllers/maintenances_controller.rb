class MaintenancesController < ApplicationController
  # Controller Code

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
      params.permit(:title, :description, :active)
    end
end