ActiveSupport::Notifications.subscribe("order.status_changed") do |name, start, finish, id, payload|
  order = payload[:order]
  Rails.logger.info "[EVENT] Order ##{order.id} changed to #{order.status}"
end
