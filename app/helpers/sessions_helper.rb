module SessionsHelper
  def giao_vien_log_in gv
    session[:giao_vien_id] = gv.id
  end

  def sinh_vien_log_in sv
    session[:sinh_vien_id] = sv.id
  end

  def current_giao_vien
    @current_giao_vien ||= GiaoVien.find_by id: session[:giao_vien_id]
  end

  def current_sinh_vien
    @current_sinh_vien ||= SinhVien.find_by id: session[:sinh_vien_id]
  end

  def giao_vien_logged_in?
    !current_giao_vien.nil?
  end

  def sinh_vien_logged_in?
    !current_sinh_vien.nil?
  end

  def giao_vien_log_out
    session.delete :giao_vien_id
    @current_giao_vien = nil
  end

  def sinh_vien_log_out
    session.delete :sinh_vien_id
    @current_sinh_vien = nil
  end
end
