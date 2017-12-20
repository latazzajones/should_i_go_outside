class AirReport

  def self.request
    self.new.request
  end

  def request
    Rails.cache.fetch "air", expires_in: 1.hour do
      json = JSON.parse air.body

      measurements(json)
    end
  end

  private

  def measurements(json)
    json["results"].map {|location| location["measurements"]}.flatten
  end

  def air
    Faraday.get(uri) 
  end

  def uri
    "https://api.openaq.org/v1/latest?city=BALTIMORE"
  end

end
