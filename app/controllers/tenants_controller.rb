class TenantsController < ApplicationController
  # Controller Code

  before_action :set_tenant, only: [:show, :update, :destroy]


  def index
    @tenants = Tenant.all
    render json: @tenants
  end


  def show
    render json: @tenant
  end


  def create
    @tenant = Tenant.new(tenant_params)

    if @tenant.save
      render json: @tenant, status: :created, location: @tenant
    else
      render json: @tenant.errors, status: :unprocessable_entity
    end
  end


  def update
    if @tenant.update(tenant_params)
      render json: @tenant
    else
      render json: @tenant.errors, status: :unprocessable_entity
    end
  end


  def destroy
    @tenant.destroy
  end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_tenant
      @tenant = Tenant.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def tenant_params
      params.permit(:name, :phone, :username, :password, :password_confirmation, :active)
    end
end