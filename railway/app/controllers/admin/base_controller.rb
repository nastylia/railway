class Admin::BaseController < Applicationcontroller
  before_action :authenticate_user!
  before_action :check_admin

  layout "admin"

  protected

  def check_admin
    redirect_to root_path, alert "Not enought rights to view this page" unless current_user.admin?
  end
end