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

    it 'returns an object that responds to .message' do

    end

    it 'returns an object that responds to .carbon_monoxide' do

    end

    it 'returns an object that responds to .sulfur_dioxide' do

    end

    it 'returns an object that responds to .particulate_matter' do

    end

    it 'returns an object that responds to .temperature' do

    end
    
  end

  context 'the report is not created successfully' do

  end
end

def successful_weather_json
  {"coord"=>{
      "lon"=>-76.61, 
      "lat"=>39.29
      }, 
   "weather"=>[
     {"id"=>801, 
      "main"=>"Clouds", 
      "description"=>"few clouds", 
      "icon"=>"02n"}
      ], 
   "base"=>"stations", 
   "main"=>{"temp"=>281.49, 
            "pressure"=>1011, 
            "humidity"=>53, 
            "temp_min"=>276.15, 
            "temp_max"=>285.15}, 
    "wind"=>{"speed"=>4.07, "deg"=>282.501}, 
    "clouds"=>{"all"=>20}, 
    "dt"=>1513735560, 
    "sys"=>{"type"=>1, 
            "id"=>1316, 
            "message"=>0.169, 
            "country"=>"US", 
            "sunrise"=>1513772535, 
            "sunset"=>1513806377}, 
    "id"=>4347778, 
    "name"=>"Baltimore", 
    "cod"=>200}
end
