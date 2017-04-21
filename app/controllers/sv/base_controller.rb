class Sv::BaseController < ApplicationController
  layout "layouts/application_sv"

  def logged_in_sinh_vien
    unless sinh_vien_logged_in?
      flash[:danger] = t "gv.base.not_login"
      redirect_to sv_login_url
    end
  end
end
