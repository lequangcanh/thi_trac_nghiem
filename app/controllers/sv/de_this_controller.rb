class Sv::DeThisController < Sv::BaseController
  before_action :logged_in_sinh_vien
  before_action :find_mon_hoc, only: :index

  def index
    @de_this = @mon_hoc.de_this.newest.de_thi_dang_mo
  end
end
