class FoodLogsController < ProtectedController
  # TODO: make this before action work with this controller!!!!
  # Client has no update or destroy methods so it's unaffected
  # before_action :set_food_log, only: [:update, :destroy]

  # GET /food_logs
  # This method is 'indexing' ARLs, but scoped to the user and date
  def index
    @date_master_id = DateMaster.find_by(date: params[:date], user_id: params[:user_id]).id
    #
    @food_logs = FoodLog.where(:date_master_id => @date_master_id)
    #
    render json: @food_logs
  end
  # GET /food_logs/1
  # This method is actually 'indexing' all FLs
  # where the :id param represents the user, not a specific FL
  def show
    @user = User.find(params[:id])
    @food_log = @user.food_logs
    render json: @food_log
  end

  # POST /food_logs
  def create

    @date_master_id = DateMaster.find_by(date: params[:date], user_id: params[:user_id]).id
    @description = food_log_params[:description]
    @time = food_log_params[:time]
    # @calories = food_log_params[:calories]
    @food_log = FoodLog.new(:description => @description,
                            :time => @time,
                            :date_master_id => @date_master_id)
    #
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
      params.require(:food_log).permit(:time, :description, :calories, :date_master_id, :date)
    end
end
