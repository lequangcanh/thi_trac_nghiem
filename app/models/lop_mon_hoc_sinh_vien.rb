class LopMonHocSinhVien < ApplicationRecord
  self.table_name = "lop_mon_hoc_sinh_vien"

  belongs_to :sinh_vien, class_name: SinhVien.name
  belongs_to :lop_mon_hoc, class_name: LopMonHoc.name
end
