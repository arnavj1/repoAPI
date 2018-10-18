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

  # POST /children
  def create
    @landlord = Landlord.new(landlord_params)

    if @landlord.save
      render json: @landlord, status: :created, location: @landlord
    else
      render json: @landlord.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /children/1
  def update
    if @child.update(child_params)
      render json: @child
    else
      render json: @child.errors, status: :unprocessable_entity
    end
  end

  # DELETE /children/1
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
      params.permit(:name)
    end
end