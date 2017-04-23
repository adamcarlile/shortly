class ShortsController < ApplicationController
  skip_before_action :verify_authenticity_token, only: [:create]

  respond_to :html, :json, :js

  def create
    resource.save!
    respond_with resource
  end

  private

    def resource
      @resource ||= params[:id] ? Short.find(params[:id]) : Short.new(permitted_params)
    end
    helper_method :resource

    def permitted_params
      params.require(:short).permit(:url).to_h
    end

end
