class ReportCreator

  attr_reader :weather_report, :air_report

  def self.get_latest
    self.new.get_latest
  end

  def get_latest
    @weather_report = WeatherReport.request
    @air_report = AirReport.request

    report = Report.new(latest_weather, latest_air, successful?)
  end

  private

  def latest_weather
    weather_report.except("status_code") 
  end

  def latest_air
    air_report.except("status_code")
  end

  def successful?
    weather_report["status_code"] == 200 && 
      air_report["status_code"] == 200 
  end
  
end

Report = Struct.new(:weather, :air_quality, :successful?)
