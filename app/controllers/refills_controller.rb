class RefillsController < ApplicationController
  before_action :set_refill, only: [:show, :edit, :update, :destroy]

  # GET /refills
  # GET /refills.json
  def index
    @refills = Refill.all
  end

  # GET /refills/1
  # GET /refills/1.json
  def show
  end

  # GET /refills/new
  def new
    @refill = Refill.new
  end

  # GET /refills/1/edit
  def edit
  end

  # POST /refills
  # POST /refills.json
  def create
    @refill = Refill.new(refill_params)

    respond_to do |format|
      if @refill.save
        format.html { redirect_to @refill, notice: 'Refill was successfully created.' }
        format.json { render :show, status: :created, location: @refill }
      else
        format.html { render :new }
        format.json { render json: @refill.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /refills/1
  # PATCH/PUT /refills/1.json
  def update
    respond_to do |format|
      if @refill.update(refill_params)
        format.html { redirect_to @refill, notice: 'Refill was successfully updated.' }
        format.json { render :show, status: :ok, location: @refill }
      else
        format.html { render :edit }
        format.json { render json: @refill.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /refills/1
  # DELETE /refills/1.json
  def destroy
    @refill.destroy
    respond_to do |format|
      format.html { redirect_to refills_url, notice: 'Refill was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_refill
      @refill = Refill.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def refill_params
      params.require(:refill).permit(:name)
    end
end
