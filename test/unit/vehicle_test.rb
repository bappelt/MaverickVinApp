require 'test_helper'

class VehicleTest < ActiveModel::TestCase

  include ActiveModel::Lint::Tests

  def setup
      @model = Vehicle.new('4K91L125113')
  end

  def test_new
    @vehicle = Vehicle.new('4K91L125113')
    puts @vehicle.inspect
    assert_not_nil @vehicle.year
    assert_not_nil @vehicle.body
    assert_not_nil @vehicle.engine
    assert_not_nil @vehicle.plant
    assert_not_nil @vehicle.unit_number
  end
end