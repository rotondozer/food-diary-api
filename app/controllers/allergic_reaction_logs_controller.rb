class AllergicReactionLogsController < ProtectedController
  before_action :set_allergic_reaction_log, only: [:show, :update, :destroy]

  # GET /allergic_reaction_logs
  def index
    @allergic_reaction_logs = AllergicReactionLog.all

    render json: @allergic_reaction_logs
  end

  # GET /allergic_reaction_logs/1
  def show
    render json: @allergic_reaction_log
  end

  # POST /allergic_reaction_logs
  def create
    @allergic_reaction_log = AllergicReactionLog.new(allergic_reaction_log_params)

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
      params.require(:allergic_reaction_log).permit(:time, :symptom, :date_master_id)
    end
end
