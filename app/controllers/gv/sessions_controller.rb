class Gv::SessionsController < ApplicationController
  def new
  end

  def create
    giao_vien = GiaoVien.find_by ma_giao_vien: params[:session][:ma_giao_vien]
    if giao_vien && (giao_vien.tai_khoan_thitn.password == params[:session][:password])
      giao_vien_log_in giao_vien
      flash[:success] = t ".login_success"
      render :new
    else
      flash[:danger] = t ".login_fail"
      render :new
    end
  end

  def destroy
    giao_vien_log_out
    flash[:success] = t ".logout_success"
    redirect_to gv_login_url
  end
end
