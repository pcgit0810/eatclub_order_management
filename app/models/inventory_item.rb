class InventoryItem < ApplicationRecord
  def deduct(quantity)
    update(quantity: self.quantity - quantity)
    alert_if_low
  end

  def increment(quantity)
    update(quantity: self.quantity + quantity)
  end

  def alert_if_low
    if quantity < threshold
      Rails.logger.warn "Inventory low for #{name}: #{quantity} left"
    end
  end
end
