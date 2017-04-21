class Sv::DeThisController < Sv::BaseController
  before_action :logged_in_sinh_vien
  before_action :find_lop_mon_hoc, only: :index

  def index
    @de_this = @lop_mon_hoc.mon_hoc.de_this.newest.de_thi_dang_mo
  end

  private

  def find_lop_mon_hoc
    @lop_mon_hoc = current_sinh_vien.lop_mon_hocs.find_by id: params[:lop_mon_hoc_id]
    unless @lop_mon_hoc
      flash[:danger] = t ".class_not_found"
      redirect_to sv_lop_mon_hocs_path
    end
  end
end
