class FoodLogsController < ProtectedController
  # TODO change < ProtectedController
  before_action :set_food_log, only: [:show, :update, :destroy]

  # GET /food_logs
  def index
    # TODO add conditional for @user = User.find_by
    # @food_log = FoodLog.find(params[:date_master_id])
    # binding.pry
    @date_master_id = DateMaster.find_by(:date => params[:date_master_id], :user_id => params[:user_id]).id
    # binding.pry
    @food_logs = FoodLog.where(:date_master_id => @date_master_id)
    binding.pry
    render json: @food_logs
  end

  # TODO write custom controller#method for getting Logs by Date
  def logs_by_date
    # what are parameters here?
    # binding.pry
    # match 'yyyy-mm-dd' from
    # @date = DateMasters.find_by(date: 'yyyy-mm-dd')
    # find all food logs that share the same date_masters_id
    # render json: # user
  end

  # GET /food_logs/1
  def show
    # binding.pry
    @user = User.find(params[:id])
    @food_log = @user.food_logs
    render json: @food_log
    # binding.pry
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
      # @user = User.find(params[:id])
      # # # # binding.pry
      # @food_log = @user.food_logs
      # binding.pry
    end

    # Only allow a trusted parameter "white list" through.
    def food_log_params
      params.require(:food_log).permit(:time, :description, :calories, :date_master_id, :date)
    end
end
