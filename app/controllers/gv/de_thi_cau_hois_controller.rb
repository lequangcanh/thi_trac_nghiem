class Gv::DeThiCauHoisController < Gv::BaseController
  before_action :logged_in_giao_vien
  before_action :find_de_thi, only: [:index, :create, :destroy]

  def index
    @cau_hois = @de_thi.mon_hoc.cau_hois.newest
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

  def find_de_thi
    @de_thi = DeThi.find_by id: params[:de_thi_id]
    unless @de_thi
      flash[:danger] = t ".not_found"
      redirect_to gv_lop_mon_hocs_path
    end
  end
end
