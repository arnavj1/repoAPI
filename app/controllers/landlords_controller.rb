class LandlordsController < ApplicationController
  # Controller Code

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