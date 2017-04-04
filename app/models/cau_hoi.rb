class CauHoi < ApplicationRecord
  self.table_name = "cau_hoi"

  belongs_to :chuong, class_name: Chuong.name
  belongs_to :giao_vien, class_name: GiaoVien.name
  has_many :phuong_ans, class_name: PhuongAn.name
  has_many :de_thi_cau_hois, class_name: DeThiCauHoi.name
  has_many :de_this, through: :de_thi_cau_hois, source: :de_thi
end
