class Gv::DeThiCauHoisController < Gv::BaseController
  before_action :logged_in_giao_vien
  before_action :correct_giao_vien, only: [:index, :create, :destroy]

  def index
    tat_ca_cau_hois = @de_thi.mon_hoc.cau_hois.newest
    cau_hoi_da_chon = @de_thi.cau_hois.newest
    @cau_hois = tat_ca_cau_hois - cau_hoi_da_chon
  end

  def create
    if params[:cau_hoi_ids].present?
      cau_hoi_ids = params[:cau_hoi_ids]
      DeThiCauHoi.transaction do
        cau_hoi_ids.each do |cau_hoi_id|
          de_thi_cau_hoi = @de_thi.de_thi_cau_hois.new cau_hoi_id: cau_hoi_id
          de_thi_cau_hoi.save!
        end
      end
      respond_to do |format|
        format.json{render json: {message: t(".success")}}
      end
    end
  rescue => exception
    flash[:danger] = t ".fail"
    redirect_to gv_de_thi_path(@de_thi)
  end

  def destroy
    de_thi_cau_hoi = DeThiCauHoi.find_by cau_hoi_id: params[:cau_hoi_id],
      de_thi_id: params[:de_thi_id]
    if de_thi_cau_hoi.destroy
      flash[:success] = t ".success"
    else
      flash[:danger] = t ".fail"
    end
    redirect_to gv_de_thi_path @de_thi
  end

  private

  def correct_giao_vien
    @de_thi = current_giao_vien.de_this.find_by id: params[:de_thi_id]
    unless @de_thi
      flash[:danger] = t "gv.base.not_permission"
      redirect_to gv_lop_mon_hocs_url
    end
  end
end
