class CompositionsController < ApplicationController
  before_action :set_composition, only: [:show, :edit, :update, :destroy]

  def index
    @compositions = Composition.all
  end

  def show
    @proportion = Proportion.new
  end

  def new
    @composition = Composition.new
  end

  def create
    @composition = Composition.new(params_composition)
    if @composition.save
      redirect_to compositions_path
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @composition.update(params_composition)
      redirect_to compositions_path
    else
      render :edit
    end
  end

  def destroy
    @composition.destroy
    redirect_to compositions_path
  end

  private

  def set_composition
    @composition = Composition.find(params[:id])
  end

  def params_composition
    params.require(:composition).permit(:name, :color)
  end
end
