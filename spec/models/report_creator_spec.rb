require 'rails_helper'

describe 'ReportCreator', type: :model do

  subject(:report) { ReportCreator.get_latest }

  context 'the report is created successfully' do

    before do
      allow_any_instance_of(WeatherReport).to receive(:request).and_return(successful_weather_json)
    end

    it 'returns an object that responds to .successful?' do
      expect(report.successful?).to eq true
    end

    it 'returns an object that responds to .air_quality' do
      expect(report.air_quality).to eq successful_air_json
    end

    it 'returns an object that responds to .weather' do
      expect(report.weather).to eq successful_weather_json
    end
    
  end

  context 'the report is not created successfully' do

  end
end

def successful_weather_json
  {"description"=>["scattered clouds"], 
   "temp"=>{:min=>33.8, :max=>46.4, :current_tem=>39.94}}
end

def successful_air_json
  [{"no2"=>"safe!"}, {"o3"=>"safe!"}]
end
