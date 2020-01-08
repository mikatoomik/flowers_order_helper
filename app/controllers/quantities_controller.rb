class QuantitiesController < ApplicationController

  def create
      @quantity = Quantity.new(params_quantity)
      @order = Order.find(params[:order_id])
      @quantity.order = @order
      @quantity.save
      redirect_to order_path(@order)
  end


  def destroy
    @quantity = Quantity.find(params[:id])
    @quantity.destroy
    redirect_to order_path(@quantity.order_id)
  end

private

  def params_quantity
    params.require(:quantity).permit(:compositions_number, :composition_id)
  end

end
