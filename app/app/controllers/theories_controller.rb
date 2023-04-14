# frozen_string_literal: true

class TheoriesController < ApplicationController
  before_action :set_theory, only: %i[show edit update destroy]
  before_action :require_login
  skip_before_action :require_login, only: %i[index show]
  # GET /theories or /theories.json
  def index
    @theories = Theory.all
  end

  # GET /theories/1 or /theories/1.json
  def show; end

  # GET /theories/new
  def new
    @theory = Theory.new
  end

  # GET /theories/1/edit
  def edit; end

  # POST /theories or /theories.json
  def create
    @theory = Theory.new(theory_params)

    respond_to do |format|
      if @theory.save
        format.html { redirect_to theory_url(@theory), notice: 'Theory was successfully created.' }
        format.json { render :show, status: :created, location: @theory }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @theory.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /theories/1 or /theories/1.json
  def update
    respond_to do |format|
      # no assumptions are selected
      @theory.assumptions.clear if params[:theory][:assumption_ids].nil?

      if @theory.update(theory_params)
        format.html { redirect_to theory_url(@theory), notice: 'Theory was successfully updated.' }
        format.json { render :show, status: :ok, location: @theory }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @theory.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /theories/1 or /theories/1.json
  def destroy
    @theory.destroy

    respond_to do |format|
      format.html { redirect_to theories_url, notice: 'Theory was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_theory
    @theory = Theory.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def theory_params
    params.require(:theory).permit(:name, :description, assumption_ids: [])
  end
end
