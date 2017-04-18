class Gv::NgauNhienDeThisController < Gv::BaseController
  before_action :logged_in_giao_vien
  before_action :correct_giao_vien, only: :create

  def create
    so_cau_nho = params[:do_kho_nho].to_i
    so_cau_hieu = params[:do_kho_hieu].to_i
    so_cau_phan_tich = params[:do_kho_phan_tich].to_i
    so_cau_van_dung = params[:do_kho_van_dung].to_i
    so_cau_tong_hop = params[:do_kho_tong_hop].to_i
    tat_ca_cau_hoi_nho = @de_thi.mon_hoc.cau_hois.do_kho_nho
    tat_ca_cau_hoi_hieu = @de_thi.mon_hoc.cau_hois.do_kho_hieu
    tat_ca_cau_hoi_phan_tich = @de_thi.mon_hoc.cau_hois.do_kho_phan_tich
    tat_ca_cau_hoi_van_dung = @de_thi.mon_hoc.cau_hois.do_kho_van_dung
    tat_ca_cau_hoi_tong_hop = @de_thi.mon_hoc.cau_hois.do_kho_tong_hop
    cau_hoi_da_chon = @de_thi.cau_hois
    cau_hoi_nho_ngau_nhien = (tat_ca_cau_hoi_nho - cau_hoi_da_chon).sample(so_cau_nho)
    cau_hoi_hieu_ngau_nhien = (tat_ca_cau_hoi_hieu - cau_hoi_da_chon).sample(so_cau_hieu)
    cau_hoi_phan_tich_ngau_nhien = (tat_ca_cau_hoi_phan_tich - cau_hoi_da_chon).sample(so_cau_phan_tich)
    cau_hoi_van_dung_ngau_nhien = (tat_ca_cau_hoi_van_dung - cau_hoi_da_chon).sample(so_cau_van_dung)
    cau_hoi_tong_hop_ngau_nhien = (tat_ca_cau_hoi_tong_hop - cau_hoi_da_chon).sample(so_cau_tong_hop)
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

  def correct_giao_vien
    @de_thi = current_giao_vien.de_this.find_by id: params[:de_thi_id]
    unless @de_thi
      flash[:danger] = t "gv.base.not_permission"
      redirect_to gv_lop_mon_hocs_url
    end
  end
end
