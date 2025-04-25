class OrdersController < ApplicationController
  before_action :authenticate_user!, only: [:index, :create]
  before_action :move_to_index, only: [:index, :create]

  def index
    gon.public_key = ENV['PAYJP_PUBLIC_KEY']
    @order_shipping_address = OrderShippingAddress.new
    @item = Item.find(params[:item_id])
  end

  def create
    @order_shipping_address = OrderShippingAddress.new(order_params)
    @item = Item.find(params[:item_id])
    if @order_shipping_address.valid?
      pay_item
      @order_shipping_address.save
      redirect_to root_path
    else
      gon.public_key = ENV['PAYJP_PUBLIC_KEY']
      render :index, status: :unprocessable_entity
    end
  end

  private

  def order_params
    params.require(:order_shipping_address)
          .permit(:postal_code, :prefecture_id, :city, :address, :building_name, :phone_number)
          .merge(item_id: params[:item_id], user_id: current_user.id, token: params[:token])
  end

  def pay_item
    Payjp.api_key = ENV['PAYJP_SECRET_KEY']
    Payjp::Charge.create(
      amount: @item.price,
      card: order_params[:token],
      currency: 'jpy'
    )
  end

  def move_to_index
    @item = Item.find(params[:item_id])
    return unless current_user.id == @item.user.id || @item.order.present?

    redirect_to root_path
  end
end
