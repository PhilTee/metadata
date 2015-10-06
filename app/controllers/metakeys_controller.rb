class MetakeysController < ApplicationController
  before_action :set_metakey, only: [:show, :edit, :update, :destroy]

  # GET /metakeys
  # GET /metakeys.json
  def index
    @metakeys = Metakey.all
  end

  # GET /metakeys/1
  # GET /metakeys/1.json
  def show
  end

  # GET /metakeys/new
  def new
    @metakey = Metakey.new
  end

  # GET /metakeys/1/edit
  def edit
  end

  # POST /metakeys
  # POST /metakeys.json
  def create
    @metakey = Metakey.new(metakey_params)

    respond_to do |format|
      if @metakey.save
        format.html { redirect_to @metakey, notice: 'Metakey was successfully created.' }
        format.json { render :show, status: :created, location: @metakey }
      else
        format.html { render :new }
        format.json { render json: @metakey.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /metakeys/1
  # PATCH/PUT /metakeys/1.json
  def update
    #Delete all the facets prior an update, else facets removed in the form will be persisted in the db
    @metakey.facets.destroy_all
    
    respond_to do |format|
      if @metakey.update(metakey_params)
        format.html { redirect_to @metakey, notice: 'Metakey was successfully updated.' }
        format.json { render :show, status: :ok, location: @metakey }
      else
        format.html { render :edit }
        format.json { render json: @metakey.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /metakeys/1
  # DELETE /metakeys/1.json
  def destroy
    @metakey.destroy
    respond_to do |format|
      format.html { redirect_to metakeys_url, notice: 'Metakey was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_metakey
      @metakey = Metakey.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def metakey_params
      params.require(:metakey).permit(:name, :typeof, :facet_ids => [])
    end
end
