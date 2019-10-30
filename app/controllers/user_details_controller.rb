class UserDetailsController < ApplicationController
  before_action :authenticate_user!, only: [:show, :edit, :update, :destroy]

  before_action :set_user_detail, only: [:show]

  before_action :set_user_detail_specific, only: [:edit, :update, :destroy]

  # before_action :set_user_detail_specific, only: [:edit, :update, :destroy]

  # before_action :set_admin, only: [:index]



  # GET /user_details
  # GET /user_details.json
  def index
    @user_details = UserDetail.all.sort
  end

  # GET /user_details/1
  # GET /user_details/1.json
  def show
  end

  # GET /user_details/new
  def new
    @user_detail = UserDetail.new
    @user_detail.location = Location.new
  end

  # GET /user_details/1/edit
  def edit
  end

  # POST /user_details
  # POST /user_details.json
  def create
    @user_detail = UserDetail.new(user_detail_params)

    respond_to do |format|
      if @user_detail.save
        format.html { redirect_to user_detail_path(@user_detail.id), notice: 'User detail was successfully created.' }
        format.json { render :show, status: :created, location: @user_detail }
      else
        format.html { render :new }
        format.json { render json: @user_detail.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /user_details/1
  # PATCH/PUT /user_details/1.json
  def update
    respond_to do |format|
      if @user_detail.update(user_detail_params)
        format.html { redirect_to @user_detail, notice: 'User detail was successfully updated.' }
        format.json { render :show, status: :ok, location: @user_detail }
      else
        format.html { render :edit }
        format.json { render json: @user_detail.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /user_details/1
  # DELETE /user_details/1.json
  def destroy

    @user_detail.destroy
    respond_to do |format|
      format.html { redirect_to user_details_url, notice: 'User detail was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user_detail
      @user_detail = UserDetail.find(params[:id])
    end

    def set_user_detail_specific
      id = params[:id]

      if current_user.user_detail.id == id.to_i || current_user.user_detail.user_type == "admin"
        @user_detail = UserDetail.find(id)
      end
        
      if @user_detail == nil
          redirect_to root_path
      end
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_detail_params
      params.require(:user_detail).permit(:name, :description, :user_id, :user_type, location_attributes: [:state, :suburb, :address_line, :postcode])
    end
end
