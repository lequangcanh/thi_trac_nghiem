class BaiThiChiTietPhuongAn < ApplicationRecord
  self.table_name = "bai_thi_chi_tiet_phuong_an"

  belongs_to :bai_thi_chi_tiet_cau_hoi, class_name: BaiThiChiTietCauHoi.name
end
