class ProportionsController < ApplicationController

  def create
      @proportion = Proportion.new(params_proportion)
      @composition = Composition.find(params[:composition_id])
      @proportion.composition = @composition
      @proportion.save
      redirect_to composition_path(@composition)
  end

private
  def params_proportion
    params.require(:proportion).permit(:stems_number, :flower_id)
  end

end
