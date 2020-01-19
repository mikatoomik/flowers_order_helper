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
    @order = Order.find(params[:order])
    @composition.name = "#{@composition.model} #{@order.name}"
    @composition.quantities[0].compositions_number = params[:composition][:quantities_attributes]["0"][:compositions_number].to_i
    @composition.quantities[0].order = @order
    @composition.quantities[0].composition = @composition
    if @composition.save
      redirect_to composition_path(@composition)
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
    params.require(:composition).permit(:name, :model, quantities_attributes: [compositions_number: []])
  end

end
