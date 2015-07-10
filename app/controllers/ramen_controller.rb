class RamenController < ApplicationController
  before_action :set_ramen, only: [:show, :edit, :update, :destroy]

  # GET /ramen
  # GET /ramen.json
  def index
    @ramen = Ramen.all.reverse_order
  end

  def tastes
    taste = Taste.find_by(id: params[:taste_id])
    @ramen = taste.ramen
    render :index
  end

  def shops
    shop = Shop.find_by(id: params[:shop_id])
    @ramen = shop.ramen
    render :index
  end

  def chain_shops
    chain_shop = ChainShop.find_by(id: params[:chain_shop_id])
    @ramen = chain_shop.ramen
    render :index
  end

  def users
    user = User.find_by(code: params[:user_code])
    @ramen = user.ramen
    render :index
  end

  # GET /ramen/1
  # GET /ramen/1.json
  def show
  end

  # GET /ramen/new
  def new
    @ramen = Ramen.new
    @ramen.build_ramen_shop
    @ramen.ramen_tastes.build
  end

  # GET /ramen/1/edit
  def edit
  end

  # POST /ramen
  # POST /ramen.json
  def create
    @ramen = Ramen.new(ramen_params)
    @ramen.user_code = current_user.code
    ramen_associates = Array.new

    p ramen_params
    p @ramen.ramen_tastes

if false
    if params[:shop][:id].present?
      ramen_associates << @ramen.build_ramen_shop(shop_id: params[:shop][:id])
    end

    params[:tastes][:ids].split(',').each do |id|
      ramen_associates << @ramen.ramen_tastes.build(taste_id: id)
    end
    p ramen_associates

    p @ramen.inspect

    ramen_valid = @ramen.valid?
    ramen_associates.each{|associate| ramen_valid = ramen_valid && associate.valid?}
    p ramen_valid

    respond_to do |format|
      if @ramen.save
        format.html { redirect_to @ramen, notice: 'Ramen was successfully created.' }
        format.json { render :show, status: :created, location: @ramen }
      else
        format.html { render :new }
        format.json { render json: @ramen.errors, status: :unprocessable_entity }
      end
    end
  end
end

  # PATCH/PUT /ramen/1
  # PATCH/PUT /ramen/1.json
  def update
    respond_to do |format|
      if @ramen.update(ramen_params)
        format.html { redirect_to @ramen, notice: 'Ramen was successfully updated.' }
        format.json { render :show, status: :ok, location: @ramen }
      else
        format.html { render :edit }
        format.json { render json: @ramen.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /ramen/1
  # DELETE /ramen/1.json
  def destroy
    @ramen.destroy
    respond_to do |format|
      format.html { redirect_to ramen_url, notice: 'Ramen was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_ramen
      @ramen = Ramen.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def ramen_params
      params.require(:ramen).permit(:name, :picture, ramen_shop_attributes: [:id, :shop_id], ramen_tastes_attributes: [:id, :taste_id])
    end
end
