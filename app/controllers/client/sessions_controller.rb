class Client::SessionsController < ClientController

  def new
  end

  def create
    client_user = ClientUser.find_by_email(params[:email])
    if client && cleint_user.authenticate(params[:password])
      session[:client_user_id] = client_user.id
      redirect_to client_root_path, info: 'ログインしました。'
    else
      flash.now[:danger] = 'ログインに失敗しました。'
      render :new
    end
  end

  def destroy
    session[:client_user_id] = nil
    redirect_to client_sign_in_path, info: 'ログアウトしました。'
  end
end
