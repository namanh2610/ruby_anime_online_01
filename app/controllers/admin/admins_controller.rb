class Admin::AdminsController < ApplicationController
  before_action :logged_in_admin, only: [:show]
  layout "admin"

  def show; end

  private

  def logged_in_admin
    return false if logged_in?
    flash[:danger] = t "admin.admins.logged_in_admin.danger"
    redirect_to login_url
  end
end
