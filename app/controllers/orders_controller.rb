class OrdersController < ApplicationController

  def create
    order = Order.new(order_params)

    if order.save
      order.items.each do |item_data|
        inventory_item = InventoryItem.find_by(name: item_data["name"])
        if inventory_item
          inventory_item.deduct(item_data["quantity"].to_i)
        else
          Rails.logger.warn "Inventory item not found for: #{item_data["name"]}"
        end
      end

      render json: order, status: :created
    else
      render json: { errors: order.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def show
    order = Order.find(params[:id])
    render json: order
  rescue ActiveRecord::RecordNotFound
    render json: { error: "Order not found" }, status: :not_found
  end

  def update
    order = Order.find(params[:id])

    case params[:status]
    when "preparing"
      order.prepare!
    when "out_for_delivery"
      order.out_for_delivery!
    when "delivered"
      order.deliver!
    when "cancelled"
      order.cancel!
      order.items.each do |item_data|
        inventory = InventoryItem.find_by(name: item_data["name"])
        inventory&.increment(item_data["quantity"].to_i)
      end
    else
      return render json: { error: "Invalid status" }, status: :bad_request
    end

    render json: order
  rescue AASM::InvalidTransition => e
    render json: { error: e.message }, status: :unprocessable_entity
  rescue ActiveRecord::RecordNotFound
    render json: { error: "Order not found" }, status: :not_found
  rescue => e
    render json: { error: e.message }, status: :internal_server_error
  end

  private

  def order_params
    params.require(:order).permit(:customer_name, :total_price, items: [:name, :quantity])
  end
end
