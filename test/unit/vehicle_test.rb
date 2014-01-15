require 'test_helper'

class VehicleTest < ActiveModel::TestCase

  include ActiveModel::Lint::Tests

  def setup
    #necessary for activemodel lint tests
    @model = Vehicle.new( vin: '4K91L125113' )
  end

  def test_new
    @vehicle = Vehicle.new( vin: '4K91L125113' )
    puts @vehicle.inspect
    assert_equal 1974, @vehicle.year
    assert_equal 'Maverick 2-Door Sedan Standard', @vehicle.body
    assert_equal '250ci 6-Cylinder 1 bbl', @vehicle.engine
    assert_equal 'Kansas City', @vehicle.plant
    assert_equal 25113, @vehicle.unit_number
  end
end
