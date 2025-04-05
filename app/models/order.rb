class Order < ApplicationRecord

  include AASM

  after_update :broadcast_status_change
  validates :customer_name, presence: true

  aasm column: 'status' do
    state :placed, initial: true
    state :preparing
    state :out_for_delivery
    state :delivered
    state :cancelled

    event :prepare do
      transitions from: :placed, to: :preparing
    end

    event :out_for_delivery do
      transitions from: :preparing, to: :out_for_delivery
    end

    event :deliver do
      transitions from: :out_for_delivery, to: :delivered
    end

    event :cancel do
      transitions from: [:placed, :preparing], to: :cancelled
    end
  end

  private

  def broadcast_status_change
    if previous_changes.key?("status")
      ActiveSupport::Notifications.instrument("order.status_changed", { order: self })
    end
  end
end
