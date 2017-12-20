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
      expect(report.temperature).to eq "Bundle up!"
    end
    
  end

  context 'the report is not created successfully' do

  end
end

def successful_weather_json
  {"coord"=>{"lon"=>-76.61, "lat"=>39.29}, 
   "weather"=>[
     {"id"=>802, 
      "main"=>"Clouds", 
      "description"=>"scattered clouds", 
      "icon"=>"03n"}
    ], 
    "base"=>"stations", 
    "main"=>{"temp"=>46.6, 
             "pressure"=>1011, 
             "humidity"=>81, 
             "temp_min"=>37.4, 
             "temp_max"=>51.8}, 
    "visibility"=>16093, 
    "wind"=>{"speed"=>9.1, "deg"=>282.501}, 
    "clouds"=>{"all"=>40}, 
    "dt"=>1513737900, 
    "sys"=>{"type"=>1, 
            "id"=>1315, 
            "message"=>0.1667, 
            "country"=>"US", 
            "sunrise"=>1513772536, 
            "sunset"=>1513806378}, 
    "id"=>4347778, 
    "name"=>"Baltimore", 
    "cod"=>200}
end
