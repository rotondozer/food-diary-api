class DateMastersController < ProtectedController
  #
  before_action :set_date_master, only: [:show]

  # GET /date_masters
  def index
    #
    # write conditional to get all dates associated with user if *some param* empty
    # proceed with the code written if not
    # wait, i don' think i have to do that
    # if
    @date_masters = DateMaster.where(:user_id => params[:user_id])
    #
    render json: @date_masters
  end

  # GET /date_masters/1
  def show
    #
    @user = User.find(params[:id])
    @date_master = @user.date_masters
    render json: @date_master
    #
  end

  # POST /date_masters
  def create
    #
    # TODO add conditional to prevent creating date that already exists for that user
    #
    @user_id = params[:user_id]
    @date = params[:date_master][:date]
    #
    @date_master = DateMaster.new(:date => @date, :user_id => @user_id)
    #
    if @date_master.save
      render json: @date_master, status: :created, location: @date_master
    else
      render json: @date_master.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /date_masters/1
  def update
    #
    @old_date = params[:date_master][:id]
    @new_date = date_master_params[:date]
    @date_master_id = DateMaster.find_by(:date => @old_date, :user_id => params[:user_id]).id

    #
    if DateMaster.update(@date_master_id, :date => @new_date)
      render json: @date_master
    else
      render json: @date_master.errors, status: :unprocessable_entity
    end
  end

  # DELETE /date_masters/1
  def destroy
    # finds all/any because of .where method
    @date = DateMaster.find_by(:date => params[:id], :user_id => params[:user_id])
    @date.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_date_master
      #
      # @user = User.find(params[:id])
      # @date_master = @user.date_masters
      #
      @date_master = DateMaster.find(params[:id])
      # @old_date = date_master_params[:date_old]
    end

    # Only allow a trusted parameter "white list" through.
    def date_master_params
      params.require(:date_master).permit(:date, :user_id, :date_old, :date_new)
    end
end
