require 'test_helper'

class OrderTest < ActiveSupport::TestCase
  test "should not save order without customer_name" do
    order = Order.new
    assert_not order.save, "Saved the order without a customer_name"
  end
end