class Sv::SessionsController < Sv::BaseController
  before_action :check_sv_login, only: [:new, :create]

  def new
  end

  def create
    sinh_vien = SinhVien.find_by ma_sinh_vien: params[:session][:ma_sinh_vien]
    if sinh_vien && (sinh_vien.tai_khoan_thitn.password == params[:session][:password])
      sinh_vien_log_in sinh_vien
      flash[:success] = t ".login_success"
      redirect_to sv_lop_mon_hocs_path
    else
      flash[:danger] = t ".login_fail"
      render :new
    end
  end

  def destroy
    sinh_vien_log_out
    flash[:success] = t ".logout_success"
    redirect_to sv_login_url
  end

  private

  def check_sv_login
    if sinh_vien_logged_in?
      flash[:danger] = t "gv.base.logged_in"
      redirect_to sv_root_path
    end
  end
end
