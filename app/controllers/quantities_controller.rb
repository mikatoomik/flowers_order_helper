class QuantitiesController < ApplicationController
  before_action :set_quantity, only: [:edit, :update, :destroy]

  def create
      @quantity = Quantity.new(params_quantity)
      @order = Order.find(params[:order_id])
      @quantity.order = @order
      @quantity.save
      redirect_to order_path(@order)
  end

  def edit
  end

  def update
    if @quantity.update(params_quantity)
      redirect_to order_path(@quantity.order_id)
    else
      render :edit
    end
  end

  def destroy
    @quantity.destroy
    redirect_to order_path(@quantity.order_id)
  end

private
  def set_quantity
    @quantity = Quantity.find(params[:id])
  end

  def params_quantity
    params.require(:quantity).permit(:compositions_number, :composition_id)
  end

end
