class LopMonHoc < ApplicationRecord
  self.table_name = "lop_mon_hoc"

  has_many :lop_mon_hoc_sinh_viens, class_name: LopMonHocSinhVien.name
  has_many :sinh_viens, through: :lop_mon_hoc_sinh_viens, source: :sinh_vien
  belongs_to :giao_vien, class_name: GiaoVien.name
  belongs_to :mon_hoc, class_name: MonHoc.name
end
