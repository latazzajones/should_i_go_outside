class ReportCreator

  def self.get_latest
    self.new.get_latest
  end

  def get_latest
    report = Report.new(latest_weather)
    
  end

  private

  def latest_weather
    WeatherReport.request
  end

end

Report = Struct.new(:weather) do
  
  def successful? 
    weather["cod"] == 200 
  end

  def temperature

  end
end
