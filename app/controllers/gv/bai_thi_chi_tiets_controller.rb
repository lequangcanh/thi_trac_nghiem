class Gv::BaiThiChiTietsController < Gv::BaseController
  before_action :logged_in_giao_vien
  before_action :find_bai_thi

  def show
  end

  private

  def find_bai_thi
    @bai_thi = BaiThi.find_by id: params[:id]
    unless @bai_thi
      flash[:danger] = t ".not_found"
      redirect_to gv_root_path
    end
  end
end
