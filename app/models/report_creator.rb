class ReportCreator

  def self.get_latest
    self.new.get_latest
  end

  def get_latest
    report = Report.new(latest_weather, latest_air)
  end

  private

  def latest_weather
    WeatherReport.request
  end

  def latest_air
    AirReport.request
  end

end

Report = Struct.new(:weather, :air_quality) do

  def successful? 
    weather["status_code"] == 200 && air_quality["status_code"] == 200 
  end

end
