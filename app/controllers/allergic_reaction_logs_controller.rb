class AllergicReactionLogsController < ProtectedController
  # TODO: make this before action work with this controller!!!!
  # Client has no update or destroy methods so it's unaffected
  # before_action :set_allergic_reaction_log, only: [:update, :destroy]

  # GET /allergic_reaction_logs
  # This method is 'indexing' ARLs, but scoped to the user and date
  def index
    @date_master_id = DateMaster.find_by(date: params[:date], user_id: params[:user_id]).id
    #
    @allergic_reaction_logs = AllergicReactionLog.where(date_master_id: @date_master_id)
    #
    render json: @allergic_reaction_logs
  end

  # GET /allergic_reaction_logs/1
  # This method is actually 'indexing' all ARLs
  # where the :id param represents the user, not a specific ARL
  def show
    @user = User.find(params[:id])
    @allergic_reaction_log = @user.allergic_reaction_logs
    render json: @allergic_reaction_log
  end

  # POST /allergic_reaction_logs
  def create
    @date_master_id = DateMaster.find_by(date: params[:date], user_id: params[:user_id]).id
    @symptom = allergic_reaction_log_params[:symptom]
    @time = allergic_reaction_log_params[:time]
    @allergic_reaction_log = AllergicReactionLog.new(:symptom => @symptom, :time => @time, :date_master_id => @date_master_id)

    if @allergic_reaction_log.save
      render json: @allergic_reaction_log, status: :created, location: @allergic_reaction_log
    else
      render json: @allergic_reaction_log.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /allergic_reaction_logs/1
  def update
    if @allergic_reaction_log.update(allergic_reaction_log_params)
      render json: @allergic_reaction_log
    else
      render json: @allergic_reaction_log.errors, status: :unprocessable_entity
    end
  end

  # DELETE /allergic_reaction_logs/1
  def destroy
    @allergic_reaction_log.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_allergic_reaction_log
      @allergic_reaction_log = AllergicReactionLog.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def allergic_reaction_log_params
      params.require(:allergic_reaction_log).permit(:time, :symptom, :date_master_id, :date)
    end
end
