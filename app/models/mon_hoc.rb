class MonHoc < ApplicationRecord
  self.table_name = "mon_hoc"

  has_many :lop_mon_hocs, class_name: LopMonHoc.name
  has_many :giao_viens, through: :lop_mon_hocs, source: :giao_vien
  has_many :cau_hois, class_name: CauHoi.name
  has_many :de_this, class_name: DeThi.name
end
