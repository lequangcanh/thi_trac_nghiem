class Sv::DeThisController < Sv::BaseController
  before_action :logged_in_sinh_vien
  before_action :find_mon_hoc, only: :index

  def index
    if find_lop_mon_hoc_sinh_vien @mon_hoc
      @de_this = @mon_hoc.de_this.newest.de_thi_dang_mo
    else
      flash[:danger] = t ".not_found"
      redirect_to sv_lop_mon_hocs_path
    end
  end

  private

  def find_lop_mon_hoc_sinh_vien mon_hoc
    lop_mon_hoc_sinh_viens = current_sinh_vien.lop_mon_hoc_sinh_viens
    lop_mon_hoc_sinh_viens.each do |lop_mon_hoc_sinh_vien|
      if lop_mon_hoc_sinh_vien.lop_mon_hoc.mon_hoc.id == mon_hoc.id
        return lop_mon_hoc_sinh_vien
      end
    end
    return
  end
end
