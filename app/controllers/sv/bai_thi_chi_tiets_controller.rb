class Sv::BaiThiChiTietsController < Sv::BaseController
  before_action :logged_in_sinh_vien
  before_action :find_bai_thi

  def show
    unless @bai_thi.de_thi.xem_ket_qua
      flash[:danger] = t ".not_found"
      redirect_to sv_root_path
    end
  end

  private

  def find_bai_thi
    @bai_thi = current_sinh_vien.bai_this.find_by id: params[:id]
    unless @bai_thi
      flash[:danger] = t ".not_found"
      redirect_to sv_root_path
    end
  end
end
