class Api::V1::ReportsController < ApplicationController

  def create
    report = ReportCreator.get_latest

    if report.successful? 
      render json: { message: report.message,
                     details: { 
                       carbon_monoxide: report.carbon_monoxide,
                       sulfur_dioxide: report.sulfur_dioxide,
                       particulate_matter_under_25: report.particulate_matter,
                       temperature: report.temperature
                      }
                   }
    else
      render json: { message: "Something went wrong 🙀" }
  end

end
