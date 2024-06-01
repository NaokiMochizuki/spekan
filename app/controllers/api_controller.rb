class ApiController < ApplicationController
  #before_action :check_client_user_token
  #skip_before_action :check_client_user_token, only: [:current_client_user, :current_client]

  def current_client_user
    if session[:client_user_token].present?
      return @current_client_user if @current_client_user.present?
      payload = ClientUser.decode_token(session[:client_user_token])
      @current_client_user = ClientUser.find_by(id: payload[0]['id'])
    end
  end
  helper_method :current_client_user

  def current_client
    if session[:client_user_token].present?
      payload = ClientUser.decode_token(session[:client_user_token])
      current_client_user ||= ClientUser.find_by(id: payload[0]['id'])
      @current_client = current_client_user.try(:client)
    end
  end
  helper_method :current_client

  def check_client_user_token
    head :unauthorized if bearer_token.blank?
    head :unauthorized if bearer_token != session[:client_user_token]
    payload = ClientUser.decode_token(bearer_token)
    head :unauthorized  if payload[0]['exp'] < Time.zone.now.to_i
  end

  private
  def bearer_token
    pattern = /^Bearer /
    header = request.headers['Authorization']
    header.gsub(pattern, '') if header&.match(pattern)
  end

end
