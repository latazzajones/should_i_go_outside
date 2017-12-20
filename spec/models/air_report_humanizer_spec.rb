require 'rails_helper'

describe 'AirReportHumanizer' do
  let(:measurements) { [ {"parameter"=>"no2", 
                          "value"=>0.027,
                          "unit"=>"ppm"}, 
                         {"parameter"=>"o3", 
                          "value"=>1.3,
                          "unit"=>"ppm"} ] }

  subject(:results) {AirReportHumanizer.humanize(measurements)}

  it "returns an array with a hash for each value" do
    expect(results).to eq [{'no2' => "safe!"}, 
                           {'o3' => "not safe"}]
  end

  context "a foreign param is passed" do 
    let(:measurements) { [ {"parameter"=>"fur_balls", 
                            "value"=>"3.4", 
                            "unit"=>"ppm"} ] }  

    it "returns a helpful message" do
      expect(
        results
            ).to eq [{"fur_balls"=>"No analysis available, the measurement is 3.4ppm"}]
    end
  end

end
