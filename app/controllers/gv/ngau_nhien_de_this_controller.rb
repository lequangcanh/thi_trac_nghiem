class Gv::NgauNhienDeThisController < Gv::BaseController
  before_action :logged_in_giao_vien
  before_action :find_mon_hoc, only: :new

  def new
    @de_thi = current_giao_vien.de_this.build
  end

  def create
    @de_thi = current_giao_vien.de_this.create! de_thi_params
    so_cau_nho = params[:do_kho_nho].to_i
    so_cau_hieu = params[:do_kho_hieu].to_i
    so_cau_phan_tich = params[:do_kho_phan_tich].to_i
    so_cau_van_dung = params[:do_kho_van_dung].to_i
    so_cau_tong_hop = params[:do_kho_tong_hop].to_i
    cau_hoi_nho_ngau_nhien = @de_thi.mon_hoc.cau_hois.do_kho_nho.sample(so_cau_nho)
    cau_hoi_hieu_ngau_nhien = @de_thi.mon_hoc.cau_hois.do_kho_hieu.sample(so_cau_hieu)
    cau_hoi_phan_tich_ngau_nhien = @de_thi.mon_hoc.cau_hois.do_kho_phan_tich.sample(so_cau_phan_tich)
    cau_hoi_van_dung_ngau_nhien = @de_thi.mon_hoc.cau_hois.do_kho_van_dung.sample(so_cau_van_dung)
    cau_hoi_tong_hop_ngau_nhien = @de_thi.mon_hoc.cau_hois.do_kho_tong_hop.sample(so_cau_tong_hop)
    DeThiCauHoi.transaction do
      cau_hoi_nho_ngau_nhien.each do |cau_hoi|
        de_thi_cau_hoi = @de_thi.de_thi_cau_hois.new cau_hoi: cau_hoi
        de_thi_cau_hoi.save!
      end
      cau_hoi_hieu_ngau_nhien.each do |cau_hoi|
        de_thi_cau_hoi = @de_thi.de_thi_cau_hois.new cau_hoi: cau_hoi
        de_thi_cau_hoi.save!
      end
      cau_hoi_phan_tich_ngau_nhien.each do |cau_hoi|
        de_thi_cau_hoi = @de_thi.de_thi_cau_hois.new cau_hoi: cau_hoi
        de_thi_cau_hoi.save!
      end
      cau_hoi_van_dung_ngau_nhien.each do |cau_hoi|
        de_thi_cau_hoi = @de_thi.de_thi_cau_hois.new cau_hoi: cau_hoi
        de_thi_cau_hoi.save!
      end
      cau_hoi_tong_hop_ngau_nhien.each do |cau_hoi|
        de_thi_cau_hoi = @de_thi.de_thi_cau_hois.new cau_hoi: cau_hoi
        de_thi_cau_hoi.save!
      end
    end
    flash[:success] = t ".success"
    redirect_to gv_de_thi_path @de_thi
  rescue => exception
    flash[:danger] = t ".fail"
    redirect_to gv_de_thi_path @de_thi
  end

  private

  def de_thi_params
    params.require(:de_thi).permit :tieu_de, :thoi_gian, :so_cau_hoi,
      :thoi_gian_mo_de, :thoi_gian_dong_de, :trang_thai, :mon_hoc_id
  end
end
