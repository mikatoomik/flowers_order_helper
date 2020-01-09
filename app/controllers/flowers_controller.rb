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
    @flower = Flower.new(params_flower)
    if @flower.save
      redirect_to flowers_path
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @flower.update(params_flower)
      redirect_to flowers_path
    else
      render :edit
    end
  end

  def destroy
    @flower.destroy
    redirect_to flowers_path
  end

  private

  def set_flower
    @flower = Flower.find(params[:id])
  end

  def params_flower
    params.require(:flower).permit(:name, :color)
  end
end
