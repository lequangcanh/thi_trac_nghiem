class Gv::DeThisController < Gv::BaseController
  before_action :logged_in_giao_vien
  before_action :find_mon_hoc, only: [:index, :new]
  before_action :correct_giao_vien, only: [:edit, :update, :destroy]

  def index
    @de_this = @mon_hoc.de_this.newest
  end

  def new
    @de_thi = current_giao_vien.de_this.build
  end

  def create
    @de_thi = current_giao_vien.de_this.build de_thi_params
    if @de_thi.save
      flash[:success] = t ".success"
    else
      flash[:danger] = t ".fail"
    end
    redirect_to gv_de_this_path(mon_hoc_id: de_thi_params[:mon_hoc_id])
  end

  def show
    @de_thi = DeThi.find_by id: params[:id]
    unless @de_thi
      flash[:danger] = t ".not_found"
      redirect_to gv_de_this_path(mon_hoc_id: de_thi_params[:mon_hoc_id])
    end
  end

  def update
    if @de_thi.update_attributes de_thi_params
      flash[:success] = t ".success"
    else
      flash[:danger] = t ".fail"
    end
    redirect_to gv_de_thi_path @de_thi
  end

  def destroy
    if @de_thi.destroy
      flash[:success] = t ".success"
    else
      flash[:danger] = t ".fail"
    end
    redirect_to gv_de_this_path(mon_hoc_id: @de_thi.mon_hoc.id)
  end

  private

  def de_thi_params
    params.require(:de_thi).permit :tieu_de, :thoi_gian, :so_cau_hoi,
      :trang_thai, :mon_hoc_id
  end

  def correct_giao_vien
    @de_thi = current_giao_vien.de_this.find_by id: params[:id]
    unless @de_thi
      flash[:danger] = t "gv.base.not_permission"
      redirect_to gv_lop_mon_hocs_url
    end
  end
end
