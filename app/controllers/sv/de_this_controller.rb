class Sv::DeThisController < Sv::BaseController
  before_action :logged_in_sinh_vien
  before_action :find_lop_mon_hoc, only: :index

  def index
    @de_this = []
    @de_this.push @lop_mon_hoc.de_thi_thu if @lop_mon_hoc.de_thi_thu && @lop_mon_hoc.de_thi_thu.dang_mo
    @de_this.push @lop_mon_hoc.de_thi_gk if @lop_mon_hoc.de_thi_gk && @lop_mon_hoc.de_thi_gk.dang_mo
    @de_this.push @lop_mon_hoc.de_thi_ck if @lop_mon_hoc.de_thi_ck && @lop_mon_hoc.de_thi_ck.dang_mo
  end

  private

  def find_lop_mon_hoc
    @lop_mon_hoc = current_sinh_vien.lop_mon_hocs.find_by id: params[:lop_mon_hoc_id]
    if @lop_mon_hoc.nil?
      flash[:danger] = t ".class_not_found"
      redirect_to sv_lop_mon_hocs_path
    elsif !da_nop_hoc_phi current_sinh_vien, @lop_mon_hoc
      flash[:danger] = t ".no_money"
      redirect_to sv_lop_mon_hocs_path
    end
  end

  def da_nop_hoc_phi sinh_vien, lop_mon_hoc
    lop_mon_hoc_sinh_vien = sinh_vien.lop_mon_hoc_sinh_viens.find_by lop_mon_hoc: @lop_mon_hoc
    lop_mon_hoc_sinh_vien.da_nop
  end
end
