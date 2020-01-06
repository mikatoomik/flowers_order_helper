class FlowersController < ApplicationController
  before_action :set_flower, only: [:show, :edit, :update, :destroy]

  def index
    @flowers = Flower.all
  end

  def show
  end

  def new
    @flower = Flower.new
  end

  def create
    flower = Flower.new(params_flower)
    flower.save
  end

  def edit
  end

  def update
    @flower.update(params_flower)
  end

  def destroy
    @flower.destroy
  end

  private

  def set_flower
    @flower = Flower.find(params[:id])
  end

  def params_flower
    params.require(:flower).permit(:name, :color)
  end
end
