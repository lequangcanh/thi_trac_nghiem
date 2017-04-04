class BaiThiChiTietCauHoi < ApplicationRecord
  self.table_name = "bai_thi_chi_tiet_cau_hoi"

  belongs_to :bai_thi, class_name: BaiThi.name
  has_many :bai_thi_chi_tiet_phuong_ans, class_name: BaiThiChiTietPhuongAn.name
end
