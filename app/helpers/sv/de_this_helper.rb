module Sv::DeThisHelper
  def loai_bai_thi de_thi, lop_mon_hoc
    bai_thi = BaiThi.tim_bai_thi_cua_sv(current_sinh_vien.id, de_thi.id).first
    if bai_thi.trang_thai_done?
      if (de_thi == lop_mon_hoc.de_thi_gk) || (de_thi == lop_mon_hoc.de_thi_ck)
        content_tag :span, class: "label label-danger" do
          t ".done_exam"
        end
      else
        link_to t(".view"), sv_bai_thi_chi_tiet_path(bai_thi)
      end
    elsif bai_thi.trang_thai_doing?
      link_to t(".continue"), sv_bai_thi_path(bai_thi)
    end
  end
end
