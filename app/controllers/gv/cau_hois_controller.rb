class Gv::CauHoisController < Gv::BaseController
  before_action :logged_in_giao_vien
  before_action :find_mon_hoc, only: [:index, :new]
  before_action :correct_giao_vien, only: [:edit, :update, :destroy]

  def index
    @cau_hois = @mon_hoc.cau_hois.newest
  end

  def new
    @cau_hoi = current_giao_vien.cau_hois.build
  end

  def create
    @cau_hoi = current_giao_vien.cau_hois.build cau_hoi_params
    if @cau_hoi.save
      flash[:success] = t ".success"
    else
      flash[:danger] = t ".fail"
    end
    redirect_to gv_cau_hois_path(mon_hoc_id: cau_hoi_params[:mon_hoc_id])
  end

  def edit
  end

  def update
    if @cau_hoi.update_attributes cau_hoi_params
      flash[:success] = t ".success"
    else
      flash[:danger] = t ".fail"
    end
    redirect_to gv_cau_hois_path(mon_hoc_id: @cau_hoi.mon_hoc.id)
  end

  def destroy
    if @cau_hoi.destroy
      flash[:success] = t ".success"
    else
      flash[:danger] = t ".fail"
    end
    redirect_to gv_cau_hois_path(mon_hoc_id: @cau_hoi.mon_hoc.id)
  end

  private

  def cau_hoi_params
    params.require(:cau_hoi).permit :noi_dung, :mon_hoc_id, :do_kho,
      phuong_ans_attributes: [:id, :phuong_an, :dap_an_dung, :_destroy]
  end

  def correct_giao_vien
    @cau_hoi = current_giao_vien.cau_hois.find_by id: params[:id]
    unless @cau_hoi
      flash[:danger] = t "gv.base.not_permission"
      redirect_to gv_lop_mon_hocs_url
    end
  end
end
