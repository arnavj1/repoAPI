class LandlordsController < ApplicationController
  # Controller Code

  swagger_controller :landlords, "Landlord Management"

  swagger_api :index do
    summary "Fetches all Landlords"
    notes "This lists all the landlords"
  end

  swagger_api :show do
    summary "Shows one Landlord"
    param :path, :id, :integer, :required, "Landlord ID"
    notes "This lists the details of one landlord"
    response :not_found
  end

  swagger_api :create do
    summary "Creates a new Landlord"
    param :form, :name, :string, :required, "Full name"
    param :form, :phone, :string, :required, "Landlord phone number"
    param :form, :username, :string, :required, "Username"
    param :form, :password, :string, :required, "Password"
    param :form, :password_confirmation, :required, "Password Confirmation"
    response :not_acceptable
  end

  swagger_api :update do
    summary "Updates an existing Landlord"
    param :path, :id, :integer, :required, "Landlord ID"
    param :form, :name, :string, "Full name"
    param :form, :phone, :string, "Landlord phone number"
    param :form, :username, :string, "Username"
    param :form, :password, :string, "Password"
    param :form, :password_confirmation, :string, "Password Confirmation"
    response :not_acceptable
  end

  swagger_api :destroy do
    summary "Deletes an existing Landlord"
    param :path, :id, :integer, :required, "Landlord ID"
    response :not_found
  end

  before_action :set_landlord, only: [:show, :update, :destroy]


  def index
    @landlords = Landlord.all
    render json: @landlords
  end


  def show
    render json: @landlord
  end


  def create
    @landlord = Landlord.new(landlord_params)

    if @landlord.save
      render json: @landlord, status: :created, location: @landlord
    else
      render json: @landlord.errors, status: :unprocessable_entity
    end
  end


  def update
    if @landlord.update(landlord_params)
      render json: @landlord
    else
      render json: @landlord.errors, status: :unprocessable_entity
    end
  end


  def destroy
    @landlord.destroy
  end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_landlord
      @landlord = Landlord.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def landlord_params
      params.permit(:name, :phone, :username, :password, :password_confirmation)
    end
end