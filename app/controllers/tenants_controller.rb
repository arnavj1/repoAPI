class TenantsController < ApplicationController
  # Controller Code
  swagger_controller :tenants, "Tenant Management"

  swagger_api :index do
    summary "Fetches all Tenants"
    notes "This lists all the tenants"
  end

  swagger_api :show do
    summary "Shows one tenant"
    param :path, :id, :integer, :required, "Tenant ID"
    notes "This lists the details of one tenant"
    response :not_found
  end

  swagger_api :create do
    summary "Creates a new Tenant"
    param :form, :name, :string, :required, "Full name"
    param :form, :phone, :string, :required, "Tenant phone number"
    param :form, :username, :string, :required, "Username"
    param :form, :password, :string, :required, "Password"
    param :form, :password_confirmation, :required, "Password Confirmation"
    response :not_acceptable
  end

  swagger_api :update do
    summary "Updates an existing Tenant"
    param :path, :id, :integer, :required, "Tenant ID"
    param :form, :name, :string, "Full name"
    param :form, :phone, :string, "Tenant phone number"
    param :form, :username, :string, "Username"
    param :form, :password, :string, "Password"
    param :form, :password_confirmation, :string, "Password Confirmation"
    response :not_acceptable
  end

  swagger_api :destroy do
    summary "Deletes an existing Tenant"
    param :path, :id, :integer, :required, "Tenant ID"
    response :not_found
  end


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