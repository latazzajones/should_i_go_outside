require 'rails_helper'

describe 'Api::V1::ReportsController' do

  context 'GET api/v1/reports' do

    let(:json) { JSON.parse(response.body) }
    let(:fake_weather) { {"description"=>["clear sky"], 
                          "temp"=>{:min=>30.2, :max=>41, :current_tem=>34.12}} }
    let(:fake_air) { {"particulates"=>[{"no2"=>"safe!"}, {"o3"=>"safe!"}]} }

    let(:fake_struct) { FakeStruct.new(fake_weather, fake_air, true) }

    subject(:create_report_request) { get "/api/v1/reports" }

    before do 
      allow(ReportCreator).to receive(:get_latest).and_return fake_struct
      create_report_request
    end

    it 'returns the expected json response' do
      expect(json).to match({ weather: fake_weather, 
                                       air_quality: fake_air
                                     }.as_json) 
    end

    it 'has a status of 200' do
      expect(response.status).to eq 200
    end

    context 'the data was not retrieved successfully' do
      let(:fake_struct) { FakeStruct.new(nil, nil, false) }

      it 'returns an error message' do
        expect(json).to match({"message" => "Something went wrong 🙀 "}.as_json)
      end

      it 'has a status of 404' do
        expect(response.status).to eq 404
      end
    end

  end

end

FakeStruct = Struct.new(:weather, :air_quality, :successful?)
