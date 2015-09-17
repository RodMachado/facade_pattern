class ApplicationController < ActionController::Base

  protect_from_forgery with: :exception

  before_action :authenticate_user!

  def default_params
    {
      current_user: current_user,
      params: params
    }
  end

end
