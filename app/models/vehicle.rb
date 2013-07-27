require 'maverick_vin_parser'

class Vehicle

  extend ActiveModel::Naming
  include ActiveModel::Conversion
  include ActiveModel::Validations

  attr_accessor :year, :plant, :body, :engine, :unit_number, :vin, :valid

  def initialize(attributes = {})
    attributes.each do |name, value|
      send("#{name}=", value)
    end

    begin
      self.parse_vin
      self.valid=true
    rescue MaverickVinParser::ArgumentError
      self.valid=false
    end


  end

  def parse_vin
    vehicle_hash = MaverickVinParser.new.parse(vin.upcase)
    vehicle_hash.each do |name, value|
      self.send "#{name}=", value
    end
  end

  def persisted?
    false
  end

  def valid?
    valid
  end

end