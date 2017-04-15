class BaiThiChiTietCauHoi < ApplicationRecord
  self.table_name = "bai_thi_chi_tiet_cau_hoi"

  belongs_to :bai_thi, class_name: BaiThi.name
  has_many :bai_thi_chi_tiet_phuong_ans, class_name: BaiThiChiTietPhuongAn.name
  has_one :cau_hoi, class_name: CauHoi.name, foreign_key: :id, primary_key: :cau_hoi_id

  scope :tong_cau_dung, ->{(where tra_loi_dung: true).count}
end
