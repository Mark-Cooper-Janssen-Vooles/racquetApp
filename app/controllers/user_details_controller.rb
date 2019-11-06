class UserDetailsController < ApplicationController
  before_action :authenticate_user!, only: [:show, :edit, :update, :destroy]

  before_action :set_user_detail, only: [:show]

  before_action :set_user_detail_specific, only: [:edit, :update, :destroy]

  # before_action :set_user_detail_specific, only: [:edit, :update, :destroy]

  # before_action :set_admin, only: [:index]



  # GET /user_details
  # GET /user_details.json
  def index
    if current_user.user_detail.user_type == "admin"
      @user_detail = UserDetail.where("user_type = '1'")
    else
      redirect_to root_path
    end

    @user_details = UserDetail.all.sort
  end

  # GET /user_details/1
  # GET /user_details/1.json
  def show
  end

  def previous_purchases
      @purchases = Status.where("user_id = '#{current_user.id}'").order(:date_sold).page(params[:page]).per(5)
  end

  def sales
    @sales = Racquet.where("seller_user_id = '#{current_user.id}'") && Status.where("sold = 'true'")
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
    update_coords_based_on_suburb


    respond_to do |format|
      if @user_detail.save
        @user_detail.user_id = current_user.id

        if @user_detail.picture.attached? == false 
          one_to_seven = (1..7).to_a 
          user_image = "user#{one_to_seven.sample}.png"
          @user_detail.picture.attach(io: File.open("app/assets/images/users/#{user_image}"), filename: "#{user_image}")
          @user_detail.save
        end

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
        update_coords_based_on_suburb

        if current_user.user_detail.user_type == "admin"
          format.html { redirect_to user_details_path, notice: 'User detail was successfully updated.' }
        else
          format.html { redirect_to @user_detail, notice: 'User detail was successfully updated.' }
        end

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
      #delete racquets statuses and then the racquet
      User.find(@user_detail.user_id).racquets.each do |racquet|
        racquet.status.destroy
      end
      User.find(@user_detail.user_id).racquets.destroy_all

      if current_user.user_detail.user_type == "admin"
        format.html { redirect_to user_details_path, notice: 'User detail was successfully destroyed.' }
      else
        format.html { redirect_to new_user_detail_path, notice: 'User detail was successfully destroyed.' } 
      end

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

    def update_coords_based_on_suburb
      suburb = @user_detail.location.suburb
      
      if @user_detail.location.suburb != "" && Geocoder.search(suburb) != nil
        suburb = @user_detail.location.suburb
        coords = Geocoder.search(suburb).first.coordinates
        @user_detail.location.latitude = coords[0].to_d
        @user_detail.location.longitude = coords[1].to_d
    
        @user_detail.save
      end
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_detail_params
      params.require(:user_detail).permit(:name, :description, :user_id, :user_type, :picture, location_attributes: [:state, :suburb, :address_line, :postcode])
    end
end
