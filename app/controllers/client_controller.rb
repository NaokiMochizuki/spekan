class ClientController < ApplicationController
  layout 'client/layouts/application'

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

  def authenticate_client_user!
    if session[:client_user_id].nil?
      redirect_to admin_sign_in_path, warning: 'ログインが必要です。'
    end
  end
end