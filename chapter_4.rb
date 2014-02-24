############## Page 66 ##############
class Customer
  attr_reader :trip_date, :skill_level, :need_bike

  def initialize(args)
    @trip_date   = args[:trip_date]
    @skill_level = args[:skill_level]
    @need_bike   = args[:need_bike]
  end

  def trips
    Trip.suitable_trips(trip_date, skill_level, need_bike)
  end
end

class Trip
  def self.suitable_trips(on_date, on_difficulty, need_bike)
    # Find Trips
  end
end

moe = Customer.new(trip_date: Date.today, skill_level: :medium, need_bike: true)
moe.trips

############## Page 68 ##############
class Customer
  attr_reader :trip_date, :skill_level, :need_bike

  def initialize(args)
    @trip_date   = args[:trip_date]
    @skill_level = args[:skill_level]
    @need_bike   = args[:need_bike]
  end

  def trips
    Trip.suitable_trips(trip_date, skill_level).select do |trip|
      Bicycle.suitable_bicycle(trip.date, trip.route_type)
    end
  end
end

class Trip
  attr_reader :date, :route_type

  def self.suitable_trips(on_date, on_difficulty)
    # Find Trips
  end
end

class Bicycle
  def self.suitable_trips(trip_date, route_type)
    # Find Bicycles
  end
end

moe = Customer.new(trip_date: Date.today, skill_level: :medium, need_bike: true)
moe.trips

############## Page 69 ##############
class Trip
  attr_reader :mechanic, :bicycles

  def prepare_bicycles
    bicycles.each do |bike|
      mechanic.clean_bike(bike)
      mechanic.pump_tires(bike)
      mechanic.lube_chain(bike)
      mechanic.check_breaks(bike)
    end
  end

end

class Mechanic
  def clean_bike(bike); end
  def pump_tires(bike); end
  def lube_chain(bike); end
  def check_breaks(bike); end
end

############## Page 70 ##############
class Trip
  attr_reader :mechanic, :bicycles

  def prepare_bicycles
    bicycles.each do |bike|
      mechanic.prepare_bike(bike)
    end
  end
end

class Mechanic
  def prepare_bike(bike)
    clean_bike(bike)
    pump_tires(bike)
    lube_chain(bike)
    check_breaks(bike)
  end

  private

  def clean_bike(bike); end
  def pump_tires(bike); end
  def lube_chain(bike); end
  def check_breaks(bike); end
end

############## Page 72 ##############
class Trip
  attr_reader :bicycles, :mechanic

  def prepare
    mechanic.prepare_trip(self)
  end
end

class Mechanic
  def prepare_trip(trip)
    trip.bicycles.each do |bike|
      prepare_bicycle(bike)
    end
  end

  def prepare_bicycle(bike)
    # preppin
  end
end

############## Page 75 ##############
class Customer
  attr_reader :trip_date, :skill_level, :need_bike

  def initialize(args)
    @trip_date   = args[:trip_date]
    @skill_level = args[:skill_level]
    @need_bike   = args[:need_bike]
    @tripfinder  = args[:tripfinder]
  end

  def trips
    tripfinder.suitable_trips(on_date, of_difficulty, need_bike)
  end
end

class TripFinder
  def suitable_trips(on_date, of_difficulty, need_bike)
    Trip.suitable_trips(on_date, of_difficulty).select do |trip|
      Bicycle.suitable_bicycle(trip.date, trip.route_type)
    end
  end
end

class Trip
  def self.suitable_trip(on_date, of_difficulty)
    # ...
  end
end

class Bicycle
  def self.suitable_bicycle(trip_date, route_type)
    # ...
  end
end

tripfinder = Tripfinder.new
moe = Customer.new(tripfinder: tripfinder)
moe.trips











