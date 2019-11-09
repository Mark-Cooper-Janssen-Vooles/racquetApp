class UserDetailsController < ApplicationController
  before_action :authenticate_user!, only: [:show, :edit, :update, :destroy, :new]
  before_action :set_user_detail, only: [:show]
  before_action :set_user_detail_specific, only: [:edit, :update, :destroy]
  before_action :set_user_detail_address, only: [:edit, :update]

  # GET /user_details
  # GET /user_details.json
  def index
    #checks to see if admin is current user, if not redirects them
    if current_user != nil && current_user.user_detail != nil && current_user.user_detail.user_type == "admin"
      @user_detail = UserDetail.where("user_type = '1'")
    else
      redirect_to root_path
    end
    #view all users, from newest to oldest
    @user_details = UserDetail.all.order(created_at: :desc)
  end

  # GET /user_details/1
  # GET /user_details/1.json
  def show
  end

  def previous_purchases
    #displays users previous purchases
    @purchases = Status.where("user_id = '#{current_user.id}'").order(:date_sold).page(params[:page]).per(5)
  end

  def sales
    #displays users previous purchases
    @sales = Racquet.where("seller_user_id = '#{current_user.id}'") && Status.where("sold = 'true'")
  end

  # GET /user_details/new
  def new
    @user_detail = UserDetail.new
    @user_detail.location = Location.new
  end

  # GET /user_details/1/edit
  def edit
    # raise
  end

  # POST /user_details
  # POST /user_details.json
  def create
    @user_detail = UserDetail.new(user_detail_params)
    #sets coordinates for the entered suburb for google maps API functionality
    update_coords_based_on_suburb
    #sets user_id to current_users id
    @user_detail.user_id = current_user.id

    respond_to do |format|
      if @user_detail.save
        
        if @user_detail.picture.attached? == false 
          @user_detail.picture.attach(io: File.open("app/assets/images/users/user-default.png"), filename: "user-default.png")
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
        # update_coords_based_on_suburb

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
      #delete favourites
      if User.find(@user_detail.user_id).favourite != nil
        User.find(@user_detail.user_id).favourite.destroy
      end
      #delete user 
      User.find(@user_detail.user_id).destroy

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
      #uses geocoder to search for suburb
      suburb = @user_detail.location.suburb
      
      if @user_detail.location.suburb != "" && Geocoder.search(suburb) != nil
        suburb = @user_detail.location.suburb
        #check that country is Australia
        Geocoder.search(suburb).each_with_index do |reply, index|
          if reply.country == "Australia"
            @user_detail.location.latitude = reply.coordinates[0].to_d
            @user_detail.location.longitude = reply.coordinates[1].to_d
          end
        end

        @user_detail.save
      end
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_detail_params
      params.require(:user_detail).permit(:name, :description, :user_id, :user_type, :picture, location_attributes: [:state, :suburb, :address_line, :postcode])
    end

    def set_user_detail_address
      @location = UserDetail.find(params[:id]).location
    end
end
