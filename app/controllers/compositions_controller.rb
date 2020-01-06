class CompositionsController < ApplicationController
  before_action :set_composition, only: [:show, :edit, :update, :destroy]

  def index
    @compositions = Composition.all
  end

  def show
  end

  def new
    @composition = Composition.new
  end

  def create
    composition = Composition.new(params_composition)
    composition.save
  end

  def edit
  end

  def update
    @composition.update(params_composition)
  end

  def destroy
    @composition.destroy
  end

  private

  def set_composition
    @composition = Composition.find(params[:id])
  end

  def params_composition
    params.require(:composition).permit(:name, :color)
  end
end
