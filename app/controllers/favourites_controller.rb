class FavouritesController < ApplicationController
  before_action :set_favourite, only: [:show, :edit, :update, :destroy]

  # GET /favourites
  # GET /favourites.json
  def index
    #create a favourites list for each user depending on their logged in id.
    @favourites = Favourite.where("user_id = '#{current_user.id}'").order(created_at: :desc)
  end

  # POST /favourites
  # POST /favourites.json
  def create
    @favourite = Favourite.new(favourite_params)

    respond_to do |format|
      if @favourite.save
        delete_duplicates
        format.html { redirect_to favourites_path, notice: 'Favourite was successfully created.' }
        format.json { render :show, status: :created, location: @favourite }
      else
        format.html { render :new }
        format.json { render json: @favourite.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /favourites/1
  # DELETE /favourites/1.json
  def destroy
    @favourite.destroy
    respond_to do |format|
      format.html { redirect_to favourites_url, notice: 'Favourite was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_favourite
      @favourite = Favourite.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def favourite_params
      params.require(:favourite).permit(:user_id, :racquet_id)
    end

    def delete_duplicates
      #if a favourite was already in the list, delete the duplicate before proceeding to avoid doubles.
      Racquet.all.each do |racquet|

        possible_duplicate = Favourite.where("user_id = '#{current_user.id}' and racquet_id = '#{racquet.id}'")

        if possible_duplicate.count > 1
          possible_duplicate.last.destroy
        end
      end
    end

end
