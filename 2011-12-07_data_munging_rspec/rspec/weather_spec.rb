require "rspec"

class WeatherCalculator

  def initialize weather_row
    @weather_data = weather_row
  end

  def day_with_min_diff
    lowest_day = @weather_data.first
    @weather_data.each { | lowest_day_candidate | lowest_day = lowest_day_of(lowest_day_candidate, lowest_day) }
    lowest_day[:day_num]
  end

  private

  def temperature_difference day
    day[:max_temp] - day[:min_temp]
  end

  def lowest_day_of day_one, day_two
    temperature_difference(day_one) < temperature_difference(day_two) ? day_one : day_two
  end

end

describe WeatherCalculator do

  it "finds a difference between two temperatures" do
    temperature = WeatherCalculator.new([{:day_num => 1, :max_temp => 88, :min_temp => 59}])
    temperature.day_with_min_diff.should eql 1
  end

  it "finds a difference between two sets of temperatures" do
    temperature = WeatherCalculator.new([{:day_num => 1, :max_temp => 88, :min_temp => 59},
                                         {:day_num => 2, :max_temp => 87, :min_temp => 60}])
    temperature.day_with_min_diff.should eql 2
  end

  it "finds a difference between three sets of temperatures" do
    temperature = WeatherCalculator.new([{:day_num => 1, :max_temp => 88, :min_temp => 59},
                                         {:day_num => 2, :max_temp => 87, :min_temp => 60},
                                         {:day_num => 3, :max_temp => 100, :min_temp => 58}])
    temperature.day_with_min_diff.should eql 2
  end

end

class WeatherExtractor
  
  def initialize weather_file_path
    @weather_file = File.open weather_file_path 
  end

  def first_data_row
    @weather_file.gets

  end

end

describe WeatherExtractor do

  it "strips out the header rows" do
    weather_file = WeatherExtractor.new("weather.dat")
    weather_file.first_data_row.should_start_with "   1"
  end
    
  it "extracts the first day's weather into an array of hashes"

  it "strips out the trailer rows"
end
