class SessionsController < ApplicationController
  def new; end

  def create
    user = User.find_by account: params[:session][:account]

    if user&.authenticate(params[:session][:password])
      login_success user
    else
      login_fail
    end
  end

  def destroy
    log_out if logged_in?
    redirect_to root_url
  end

  def login_success user
    log_in user

    if params[:session][:remember_me] == Settings.sessions.login_success.remember
      check_login user
    elsif params[:session][:remember_me] == Settings.sessions.login_success.forget
      check_login user
    else
      forget user
      redirect_to new_path
    end
  end

  def check_login user
    if user.user_role.role == Settings.sessions.check_login.admin
      remember user
      redirect_to admin_index_path
    elsif user.user_role.role == Settings.sessions.check_login.user
      remember user
      redirect_to root_url
    end
  end

  def login_fail
    flash.now[:danger] = t "sessions.login_fail.danger"
    render :new
  end
end
