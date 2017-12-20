require 'rails_helper'

describe 'Api::V1::ReportsController' do

  context 'POST api/v1/reports' do

    let(:json) { JSON.parse(response.body) }
    let(:params) { "Baltimore" }

    subject(:create_report_request) { post "/api/v1/reports",
                                      params: params }

    before { create_report_request }

    it 'returns the expected response' do
      expect(json).to match({ message: "It's not so great out there",
                              details: {
                                carbon_monoxide: high, 
                                sulfur_dioxide: low, 
                                particulate_matter_under_25: medium,
                                temperature: dangerously_cold
                              }
                            }) 
    end

  end

end
