class ApiController < ApplicationController
  # TODO: ログイン機能できたら消す
  before_action :dummy_login

  def current_client_user
    if session[:client_user_id].present?
      @current_client_user ||= ClientUser.find(session[:client_user_id])
    end
  end
  helper_method :current_client_user

  def current_client
    if session[:client_user_id].present?
      current_client_user ||= ClientUser.find(session[:client_user_id])
      @current_client = current_client_user.try(:client)
    end
  end
  helper_method :current_client

  private
  def dummy_login
    session[:client_user_id] = 1
  end

end
