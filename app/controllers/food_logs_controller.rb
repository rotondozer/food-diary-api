# TODO probably change what this controller is inheriting from for authentication
# Inheriting from ApplicationController makes it completely open
class FoodLogsController < ApplicationController
  before_action :set_food_log, only: [:show, :update, :destroy]

  # GET /food_logs
  def index
    @food_logs = FoodLog.all

    render json: @food_logs
  end

  # GET /food_logs/1
  def show
    render json: @food_log
  end

  # POST /food_logs
  def create
    @food_log = FoodLog.new(food_log_params)

    if @food_log.save
      render json: @food_log, status: :created, location: @food_log
    else
      render json: @food_log.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /food_logs/1
  def update
    if @food_log.update(food_log_params)
      render json: @food_log
    else
      render json: @food_log.errors, status: :unprocessable_entity
    end
  end

  # DELETE /food_logs/1
  def destroy
    @food_log.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_food_log
      @food_log = FoodLog.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def food_log_params
      params.require(:food_log).permit(:date, :time, :description, :calories)
    end
end
