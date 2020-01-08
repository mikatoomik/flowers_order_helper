class ProportionsController < ApplicationController

  def create
      @proportion = Proportion.new(params_proportion)
      @composition = Composition.find(params[:composition_id])
      @proportion.composition = @composition
      @proportion.save
      redirect_to composition_path(@composition)
  end

  def destroy
    @proportion = Proportion.find(params[:id])
    @proportion.destroy
    redirect_to composition_path(@proportion.composition_id)
  end

private
  def params_proportion
    params.require(:proportion).permit(:stems_number, :flower_id)
  end

end
