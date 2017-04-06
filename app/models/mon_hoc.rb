class MonHoc < ApplicationRecord
  self.table_name = "mon_hoc"

  has_many :lop_mon_hocs, class_name: LopMonHoc.name
  has_many :chuyen_mons, class_name: ChuyenMon.name
  has_many :giao_viens, through: :chuyen_mons, source: :giao_vien
  has_many :cau_hois, class_name: CauHoi.name
end
