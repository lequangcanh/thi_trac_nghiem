class Sv::BaseController < ApplicationController
  layout "layouts/application_sv"

  def logged_in_sinh_vien
    unless sinh_vien_logged_in?
      flash[:danger] = t "gv.base.not_login"
      redirect_to sv_login_url
    end
  end

  def find_mon_hoc
    @mon_hoc = MonHoc.find_by id: params[:mon_hoc_id]
    unless @mon_hoc
      flash[:danger] = t "gv.base.subject_not_found"
      redirect_to sv_lop_mon_hocs_path
    end
  end
end
