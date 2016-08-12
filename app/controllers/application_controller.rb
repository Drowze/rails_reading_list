class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def authorize_admin
  	redirect_to :back, :status => 301 unless admin_signed_in?
  end
end
