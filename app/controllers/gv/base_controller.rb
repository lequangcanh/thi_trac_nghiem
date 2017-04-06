class Gv::BaseController < ApplicationController
  def logged_in_giao_vien
    unless giao_vien_logged_in?
      flash[:danger] = t "gv.base.not_login"
      redirect_to gv_login_url
    end
  end
end
