class WeatherReport

  attr_reader :json

  def self.request
    self.new.request
  end

  def request
    @json = Rails.cache.fetch "weather", expires_in: 1.hour do
      JSON.parse weather.body
    end

    weather_hash
  end

  private

  def weather_hash
    {"description"=>description, "temp"=>temp_hash}
  end

  def temp_hash
    {"min": temp_min, "max": temp_max, "current_tem": current_temp}
  end

  def description
    json['weather'].map {|list_object| list_object.dig('description')}
  end

  def current_temp
    json['main']['temp']
  end

  def temp_min
    json['main']['temp_min']
  end

  def temp_max
    json['main']['temp_max']
  end

  def weather
    Faraday.get(uri)
  end

  def uri
    "http://api.openweathermap.org/data/2.5/weather?q=Baltimore&units=imperial&APPID=#{ENV['open_weather_key']}"
  end

end
