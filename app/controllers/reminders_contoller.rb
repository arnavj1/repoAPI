class RemindersController < ApplicationController
  # Controller Code

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


  # def update
  #   if @reminder.update(reminder_params)
  #     render json: @reminder
  #   else
  #     render json: @reminder.errors, status: :unprocessable_entity
  #   end
  # end


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
      params.permit(:title, :description)
    end
end