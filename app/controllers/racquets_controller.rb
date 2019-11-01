class RacquetsController < ApplicationController
  before_action :authenticate_user!, only: [:edit, :update, :destroy]
  before_action :set_racquet, only: [:show]
  before_action :set_user_racquet, only: [:edit, :update, :destroy]

  # GET /racquets
  # GET /racquets.json
  def index
    @q = Racquet.ransack(params[:q])
    @racquets = @q.result(distinct: true)
                  .order(created_at: :desc)
                  .page(params[:page]).per(5)
    @favourite = Favourite.new
  end

  def search
    index
    render :index
  end

  # GET /racquets/1
  # GET /racquets/1.json
  def show
    #increase the view count on the page
    def increment_page_views
      @status = Racquet.find(params[:id]).status
      @status.increment!(:view_count)
    end
    increment_page_views

    if user_signed_in?
    session = Stripe::Checkout::Session.create(
      payment_method_types: ['card'],
      customer_email: current_user.email,
      line_items: [{
          name: @racquet.title,
          description: @racquet.description,
          amount: @racquet.price.to_i * 100,
          currency: 'aud',
          quantity: 1,
      }],
      payment_intent_data: {
          metadata: {
              user_id: current_user.id,
              racquet_id: @racquet.id
          }
      },
      success_url: "#{root_url}payments/success?userId=#{current_user.id}&racquetId=#{@racquet.id}",
      cancel_url: "#{root_url}racquets"
      )

  @session_id = session.id
    end
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
        Status.create(sold: false, racquet_id: @racquet.id, view_count: 0)

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

  #individual brand pages: 
  brands = ["wilson", "head", "yonex", "babolat", "dunlop", "gamma", "prince", "prokennex", "technifibre", "volkl"]
  def wilson
    @racquets = Racquet.where("brand = 'wilson'")
  end
  def head
    @racquets = Racquet.where("brand = 'head'")
  end
  def yonex
    @racquets = Racquet.where("brand = 'yonex'")
  end
  def babolat
    @racquets = Racquet.where("brand = 'babolat'")
  end
  def dunlop
    @racquets = Racquet.where("brand = 'dunlop'")
  end
  def gamma
    @racquets = Racquet.where("brand = 'gamma'")
  end
  def prince
    @racquets = Racquet.where("brand = 'prince'")
  end
  def prokennex
    @racquets = Racquet.where("brand = 'prokennex'")
  end
  def technifibre
    @racquets = Racquet.where("brand = 'technifibre'")
  end
  def volkl
    @racquets = Racquet.where("brand = 'volkl'")
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_racquet
      @racquet = Racquet.find(params[:id])
    end

    def set_user_racquet
      id = params[:id]

      if current_user.racquets.count > 0 && current_user.racquets.find_by_id(id)
        @racquet = current_user.racquets.find_by_id(id)
      elsif current_user.user_detail.user_type == "admin"
        @racquet = Racquet.find(id)
      end

      if @racquet == nil
        redirect_to root_path
      end
    end
  
    # Never trust parameters from the scary internet, only allow the white list through.
    def racquet_params
      params.require(:racquet).permit(:seller_user_id, :description, :head_size, :length, :strung_weight, :balance, :stiffness, :string_pattern, :brand, :racquet_type, :picture, :title, :price)
    end


end