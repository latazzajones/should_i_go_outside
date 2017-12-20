class WeatherReport

  def self.request
    self.new.request
  end

  def request
    json = Rails.cache.fetch "weather", expires_id: 1.hour do
      JSON.parse weather.body
    end
    
    json
  end

  def weather
    @weather ||= Faraday.get(uri)
  end

  def uri
    "http://api.openweathermap.org/data/2.5/weather?q=Baltimore&units=imperial&APPID=#{ENV['open_weather_key']}"
  end

end
