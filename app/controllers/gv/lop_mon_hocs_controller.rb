class Gv::LopMonHocsController < Gv::BaseController
  before_action :logged_in_giao_vien
  before_action :find_lop_mon_hoc, only: [:show, :update]

  def index
    @lop_mon_hocs = current_giao_vien.lop_mon_hocs
  end

  def update
    if @lop_mon_hoc.update_attributes lop_mon_hoc_params
      flash[:success] = t ".success"
    else
      flash[:danger] = t ".fail"
    end
    redirect_to gv_lop_mon_hoc_path @lop_mon_hoc
  end

  private

  def lop_mon_hoc_params
    params.require(:lop_mon_hoc).permit :de_thi_gk_id, :de_thi_ck_id
  end

  def find_lop_mon_hoc
    @lop_mon_hoc = current_giao_vien.lop_mon_hocs.find_by id: params[:id]
    unless @lop_mon_hoc
      flash[:danger] = t ".not_found"
      redirect_to gv_lop_mon_hocs_path
    end
  end
end
