class AssumptionsController < ApplicationController
  before_action :set_assumption, only: %i[ show edit update destroy ]
  # before_action :require_login, only: [:new, :create, :edit, :update, :destroy]
  # GET /assumptions or /assumptions.json
  def index
    @assumptions = Assumption.all
  end

  # GET /assumptions/1 or /assumptions/1.json
  def show
  end

  # GET /assumptions/new
  def new
    @assumption = Assumption.new
  end

  # GET /assumptions/1/edit
  def edit
  end

  # POST /assumptions or /assumptions.json
  def create
    @assumption = Assumption.new(assumption_params)

    respond_to do |format|
      if @assumption.save
        format.html { redirect_to assumption_url(@assumption), notice: "Assumption was successfully created." }
        format.json { render :show, status: :created, location: @assumption }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @assumption.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /assumptions/1 or /assumptions/1.json
  def update
    respond_to do |format|
      
      #no theory select
      if params[:assumption][:theory_ids].nil?
        @assumption.theories.clear
      end
      
      #no practice select
      if params[:assumption][:practice_ids].nil?
        @assumption.practices.clear
      end
      
      if @assumption.update(assumption_params)
        format.html { redirect_to assumption_url(@assumption), notice: "Assumption was successfully updated." }
        format.json { render :show, status: :ok, location: @assumption }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @assumption.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /assumptions/1 or /assumptions/1.json
  def destroy
    @assumption.destroy

    respond_to do |format|
      format.html { redirect_to assumptions_url, notice: "Assumption was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_assumption
      @assumption = Assumption.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def assumption_params
      params.require(:assumption).permit(:name, :description, theory_ids: [], practice_ids: [])
    end
end
