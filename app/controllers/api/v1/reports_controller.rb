class Api::V1::ReportsController < ApplicationController

  def index
    report = ReportCreator.get_latest

    if report.successful? 
      render json: { weather: report.weather,
                     air_quality: report.air_quality}, status: 200
    else
      render json: { message: "Something went wrong 🙀 " }, status: 404
    end
  end

end
