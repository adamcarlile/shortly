class ShortsController < ApplicationController
  skip_before_action :verify_authenticity_token, only: [:create]

  respond_to :html, :json, :js

  def new
    @resource = Short.new
  end

  def show
    if resource
      redirect_to(resource.url.to_s, status: :moved_permanently)
    else
      head :not_found
    end
  end

  def create
    if resource.valid?
      resource.save
      respond_with resource
    else
      render :new
    end
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
