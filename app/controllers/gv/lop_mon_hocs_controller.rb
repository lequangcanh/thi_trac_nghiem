class Gv::LopMonHocsController < Gv::BaseController
  before_action :logged_in_giao_vien

  def index
    @lop_mon_hocs = current_giao_vien.lop_mon_hocs
  end
end
