require 'test_helper'

class UnitTest < ActiveSupport::TestCase
  setup do
    @unit = units(:example)
  end

  test '#valid?' do
    assert @unit.valid?
  end

  test '#price' do
    assert_equal 149.99, @unit.price
  end
end
