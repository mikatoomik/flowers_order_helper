class OrdersController < ApplicationController
  before_action :set_order, only: [:show, :edit, :update, :destroy]
  before_action :init_cmd, only: [:show, :show_by_date]

  def index
    @orders = Order.where("user_id = ?", current_user)
  end

  def show
    @quantity = Quantity.new
    @cmd_detail = {}
    calcul_quantity
  end

  def show_by_date
    @orders = Order.where("user_id = ? AND date = ?", current_user, params[:format])
    @orders.each do |order|
      @cmd_detail = {}
      @order = order
      calcul_quantity
    end
  end

  def new
    @order = Order.new
  end

  def create
    @order = Order.new(params_order)
    @order.user = current_user
    if @order.save
      redirect_to orders_path
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @order.update(params_order)
      redirect_to orders_path
    else
      render :edit
    end
  end

  def destroy
    @order.destroy
    redirect_to orders_path
  end

  private

  def init_cmd
    @cmd_gal = {}
    @group = {}
  end

  def calcul_quantity
    @order.quantities.each do |quantity|
      quantity.composition.flowers.each do |flower|
        nb = 0
        label = "#{flower.name} #{flower.color}"
        prop = flower.proportions.find_by(composition_id: quantity.composition.id).stems_number
        nb += prop * quantity.compositions_number
        if @cmd_gal.key?(label)
          @cmd_gal[label] += nb
        else
          @cmd_gal[label] = nb
        end
        if @cmd_detail.key?(label)
          @cmd_detail[label] += nb
        else
          @cmd_detail[label] = nb
        end
      end
    end
    @group[@order.name] = @cmd_detail
  end

  def set_order
    @order = Order.find(params[:id])
  end

  def params_order
    params.require(:order).permit(:date, :name)
  end
end
