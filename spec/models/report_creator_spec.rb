require 'rails_helper'

describe 'ReportCreator', type: :model do

  subject(:report) { ReportCreator.get_latest }

  context 'the report is created successfully' do

    before do
      allow(WeatherReport).to receive(:request).and_return(successful_weather_json)
      allow(AirReport).to receive(:request).and_return(successful_air_json)
    end

    it 'returns an object that responds to .successful?' do
      expect(report.successful?).to eq true
    end

    it 'returns an object that responds to .air_quality' do
      expect(report.air_quality).to eq successful_air_json.except("status_code")
    end

    it 'returns an object that responds to .weather' do
      expect(report.weather).to eq successful_weather_json.except("status_code")
    end
    
  end

  context 'the report is not created successfully' do
    before do
      allow(WeatherReport).to receive(:request).and_return(unsuccessful_json)
      allow(AirReport).to receive(:request).and_return(unsuccessful_json)
    end

    it 'returns an object that responds to .successful?' do
      expect(report.successful?).to eq false
    end

  end
end

def successful_weather_json
  {"description"=>["clear sky"], 
   "temp"=>{:min=>30.2, :max=>44.6, :current_tem=>35.78}, 
   "status_code"=>200}
end

def successful_air_json
  {"particulates"=>[{"no2"=>"safe!"}, {"o3"=>"safe!"}], "status_code"=>200}
end

def unsuccessful_json
  {"status_code"=>404}
end
