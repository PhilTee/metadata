class MetavaluesController < ApplicationController
  before_action :set_metakey, only: [:destroy]

  # DELETE /metavalues/1
  # DELETE /metavalues/1.json
  def destroy
    @metavalue.destroy
    respond_to do |format|
      format.html { redirect_to :back, notice: 'Metavalue was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_metakey
      @metavalue = Metavalue.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    # def metakey_params
    #   params.require(:metakey).permit(:name, :typeof, :facet_ids => [])
    # end
end
