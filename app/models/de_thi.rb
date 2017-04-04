class DeThi < ApplicationRecord
  self.table_name = "de_thi"

  belongs_to :mon_hoc, class_name: MonHoc.name
  has_many :de_thi_cau_hois, class_name: DeThiCauHoi.name
  has_many :cau_hois, through: :de_thi_cau_hois, source: :cau_hoi
  has_many :bai_this, class_name: BaiThi.name
end
