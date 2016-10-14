class Admin::BaseController < ApplicationController
  before_action :authenticate_user!
  before_action :check_admin

  protected

  def check_admin
    flash[:notice] = "Not enought rights to view this page"
    redirect_to root_path unless current_user.admin?
  end
end