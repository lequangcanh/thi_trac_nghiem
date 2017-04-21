module Gv::LopMonHocsHelper
  def diem_bai_thi_cua_sv sinh_vien_id, de_thi_id
    bai_thi = BaiThi.tim_bai_thi_cua_sv(sinh_vien_id, de_thi_id).first
    if bai_thi && bai_thi.trang_thai_done?
      link_to gv_bai_thi_chi_tiet_path(bai_thi), title: t(".detail") do
        content_tag :span, bai_thi.tong_diem
      end
    elsif bai_thi && bai_thi.trang_thai_doing?
      content_tag :span, class: "label label-info" do
        t "sv.bai_this.trang_thai.doing"
      end
    else
      content_tag :span, class: "label label-danger" do
        t "sv.bai_this.trang_thai.unmake"
      end
    end
  end
end
