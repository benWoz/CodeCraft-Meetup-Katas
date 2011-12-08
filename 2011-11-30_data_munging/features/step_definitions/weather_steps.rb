class WeatherDataCalculator
  def initialize file_name
    @weather_file = File.open(file_name)
    skip_past_header_lines
  end

  def first_day_spread
    get_spread_for(@weather_file.gets).last
  end

  def day_with_lowest_spread
    @lowest = 1, first_day_spread
    while line = @weather_file.gets do
      @current_spread = get_spread_for line
      @lowest = @current_spread if @current_spread[1] < @lowest[1]
    end   
    @lowest[0]
  end

  private
  
  def skip_past_header_lines
    8.times { @weather_file.gets }
  end

  def get_spread_for weather_data_line
    day =  weather_data_line.split(' ')[0..2] 
    [day[0], (day[1].to_i - day[2].to_i)]
  end

end

Given /^I have a weather data file$/ do
  @weather_calc = WeatherDataCalculator.new("weather.dat")
end

When /^I process the file's first day$/ do
  @spread = @weather_calc.first_day_spread
end

Then /^I should see the first day's temperature spread$/ do
  @spread.should eql 29
end

When /^I process the entire file$/ do
  @day = @weather_calc.day_with_lowest_spread
end

Then /^I should see the day with the lowest temperature spread$/ do
  @day.should eql 17
end

