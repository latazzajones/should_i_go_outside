class AirReportHumanizer

  attr_reader :measurements

  def initialize(measurements)
    @measurements = measurements
  end

  def self.humanize(measurements)
    self.new(measurements).humanize 
  end

  def humanize
    measurements.map do |measurement|
      { measurement['parameter'] => safe_or_not_safe(measurement) }
    end 
  end

  def safe_or_not_safe(measurement)
    param = measurement['parameter']
    value = measurement['value']

    if param == 'no2'
      value < 1.6 ? "safe!" : "not safe"
    elsif param  == 'o3'
      value < 1.0 ? "safe!" : "not safe"
    else

      "No analysis available, the measurement is #{measurement['value']}#{measurement['unit']}"
    end
  end

end
