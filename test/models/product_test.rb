require 'test_helper'

class ProductTest < ActiveSupport::TestCase

  def setup
    @user = users(:michael)
    @product = @user.products.build(name: "Sweater", description: "A SOSY Sweater", price: 7.95)
  end

  test "should be valid" do
    assert @product.valid?
  end

  test "user id should be present" do
    @product.user_id = nil
    assert_not @product.valid?
  end
  
  test "Description should be present" do
    @product.description = "   "
    assert_not @product.valid?
  end
  
  test "order should be most recent first" do
    assert_equal products(:most_recent), Product.first
  end

end
