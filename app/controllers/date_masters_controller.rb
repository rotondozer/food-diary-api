class DateMastersController < ApplicationController
  before_action :set_date_master, only: [:show, :update, :destroy]

  # GET /date_masters
  def index
    # binding.pry
    # write conditional to get all dates associated with user if *some param* empty
    # proceed with the code written if not
    # wait, i don' think i have to do that
    # if
    @date_masters = DateMaster.where(:user_id => params[:user_id])
    # binding.pry
    render json: @date_masters
  end

  # GET /date_masters/1
  def show
    # binding.pry
    @user = User.find(params[:id])
    @date_master = @user.date_masters
    render json: @date_master
    # binding.pry
  end

  # POST /date_masters
  def create
    @date_master = DateMaster.new(date_master_params)

    if @date_master.save
      render json: @date_master, status: :created, location: @date_master
    else
      render json: @date_master.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /date_masters/1
  def update
    if @date_master.update(date_master_params)
      render json: @date_master
    else
      render json: @date_master.errors, status: :unprocessable_entity
    end
  end

  # DELETE /date_masters/1
  def destroy
    @date_master.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_date_master
      # binding.pry
      # @user = User.find(params[:id])
      # @date_master = @user.date_masters
      @date_master = DateMaster.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def date_master_params
      params.require(:date_master).permit(:date, :user_id)
    end
end
