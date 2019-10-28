class RacquetsController < ApplicationController
  before_action :set_racquet, only: [:show, :edit, :update, :destroy]

  # GET /racquets
  # GET /racquets.json
  def index
    @racquets = Racquet.all.sort
  end

  # GET /racquets/1
  # GET /racquets/1.json
  def show
  end

  # GET /racquets/new
  def new
    @racquet = Racquet.new
  end

  # GET /racquets/1/edit
  def edit
  end

  # POST /racquets
  # POST /racquets.json
  def create
    @racquet = Racquet.new(racquet_params)

    respond_to do |format|
      if @racquet.save
        format.html { redirect_to @racquet, notice: 'Racquet was successfully created.' }
        format.json { render :show, status: :created, location: @racquet }
      else
        format.html { render :new }
        format.json { render json: @racquet.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /racquets/1
  # PATCH/PUT /racquets/1.json
  def update
    respond_to do |format|
      if @racquet.update(racquet_params)
        format.html { redirect_to @racquet, notice: 'Racquet was successfully updated.' }
        format.json { render :show, status: :ok, location: @racquet }
      else
        format.html { render :edit }
        format.json { render json: @racquet.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /racquets/1
  # DELETE /racquets/1.json
  def destroy
    @racquet.destroy
    respond_to do |format|
      format.html { redirect_to racquets_url, notice: 'Racquet was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_racquet
      @racquet = Racquet.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def racquet_params
      params.require(:racquet).permit(:seller_user_id, :description, :head_size, :length, :strung_weight, :balance, :stiffness, :string_pattern, :brand, :racquet_type)
    end
end
