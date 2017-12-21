class AirReport

  attr_reader :json

  def self.request
    self.new.request
  end

  def request
    Rails.cache.fetch "air", expires_in: 1.hour do
      @json = JSON.parse air.body

      {"particulates"=>humanize, "status_code"=>air.status}
    end
  end

  private

  def humanize
    measurements = json["results"].map {|location| location["measurements"]}.flatten

    AirReportHumanizer.humanize(measurements)
  end

  def air
    Faraday.get(uri) 
  end

  def uri
    "https://api.openaq.org/v1/latest?city=BALTIMORE"
  end

end
