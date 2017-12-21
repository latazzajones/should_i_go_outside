class Api::V1::ReportsController < ApplicationController

  def create
    report = ReportCreator.get_latest

    if report.successful? 
      render json: { message: report.message,
                     details: { 
                       temperature: report.temperature,
                       air_quality: report.air_quality
                      }
                   }
    else
      render json: { message: "Something went wrong 🙀 " }
    end
  end

end
