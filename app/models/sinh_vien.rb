class SinhVien < ApplicationRecord
  self.table_name = "sinh_vien"

  has_many :lop_mon_hoc_sinh_viens, class_name: LopMonHocSinhVien.name
  has_many :lop_mon_hocs, through: :lop_mon_hoc_sinh_viens, source: :lop_mon_hoc
  has_many :bai_this, class_name: BaiThi.name
  has_one :tai_khoan_thitn, class_name: TaiKhoanThitn.name, as: :nguoi_dung
end
