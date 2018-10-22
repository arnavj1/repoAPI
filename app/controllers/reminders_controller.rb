class RemindersController < ApplicationController
  # Controller Code
  swagger_controller :reminders, "Reminder Management"

  swagger_api :index do
    summary "Fetches all reminders"
    notes "This lists all reminders"
  end

  swagger_api :show do
    summary "Shows one reminder"
    param :path, :id, :integer, :required, "Reminder ID"
    notes "This lists the details of one reminder"
    response :not_found
  end

  swagger_api :create do
    summary "Creates a new reminder"
    param :form, :title, :string, :required, "Title of a reminder"
    param :form, :description, :string, :required, "Description of a reminder"
    response :not_acceptable
  end

  swagger_api :update do
    summary "Updates a new reminder"
    param :form, :title, :string, "Title of a reminder"
    param :form, :description, :string,"Description of a reminder"
    response :not_acceptable
  end

  swagger_api :destroy do
    summary "Deletes an existing reminder"
    param :path, :id, :integer, :required, "Reminder ID"
    response :not_found
  end

  before_action :set_reminder, only: [:show, :update, :destroy]


  def index
    @reminders = Reminder.all
    render json: @reminders
  end


  def show
    render json: @reminder
  end


  def create
    @reminder = Reminder.new(reminder_params)

    if @reminder.save
      render json: @reminder, status: :created, location: @reminder
    else
      render json: @reminder.errors, status: :unprocessable_entity
    end
  end


  def update
    if @reminder.update(reminder_params)
      render json: @reminder
    else
      render json: @reminder.errors, status: :unprocessable_entity
    end
  end


  def destroy
    @reminder.destroy
  end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_reminder
      @reminder = Reminder.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def reminder_params
      params.permit(:title, :description, :created_on)
    end
end