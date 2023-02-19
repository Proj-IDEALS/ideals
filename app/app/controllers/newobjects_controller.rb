class NewobjectsController < ApplicationController
  before_action :set_newobject, only: %i[ show edit update destroy ]

  # GET /newobjects or /newobjects.json
  def index
    @newobjects = Newobject.all
  end

  # GET /newobjects/1 or /newobjects/1.json
  def show
  end

  # GET /newobjects/new
  def new
    @newobject = Newobject.new
  end

  # GET /newobjects/1/edit
  def edit
  end

  # POST /newobjects or /newobjects.json
  def create
    @newobject = Newobject.new(newobject_params)

    respond_to do |format|
      if @newobject.save
        format.html { redirect_to newobject_url(@newobject), notice: "New Object was successfully created." }
        format.json { render :show, status: :created, location: @newobject }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @newobject.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /newobjects/1 or /newobjects/1.json
  def update
    respond_to do |format|
      if @newobject.update(newobject_params)
        format.html { redirect_to newobject_url(@newobject), notice: "Newobject was successfully updated." }
        format.json { render :show, status: :ok, location: @newobject }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @newobject.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /newobjects/1 or /newobjects/1.json
  def destroy
    @newobject.destroy

    respond_to do |format|
      format.html { redirect_to newobjects_url, notice: "Newobject was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_newobject
      @newobject = Newobject.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def newobject_params
      params.require(:newobject).permit(:Name, :Category, :Details, :Linkto)
    end
end
