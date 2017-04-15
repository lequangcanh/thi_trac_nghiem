class Sv::LopMonHocsController < Sv::BaseController
  before_action :logged_in_sinh_vien

  def index
    @lop_mon_hoc_sinh_viens = current_sinh_vien.lop_mon_hoc_sinh_viens
  end
end
