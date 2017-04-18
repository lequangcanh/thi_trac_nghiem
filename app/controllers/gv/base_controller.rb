class Gv::BaseController < ApplicationController
  layout "layouts/application_gv"

  def logged_in_giao_vien
    unless giao_vien_logged_in?
      flash[:danger] = t "gv.base.not_login"
      redirect_to gv_login_url
    end
  end

  def find_mon_hoc
    @mon_hoc = current_giao_vien.mon_hocs.find_by id: params[:mon_hoc_id]
    unless @mon_hoc
      flash[:danger] = t "gv.base.subject_not_found"
      redirect_to gv_lop_mon_hocs_path
    end
  end
end
