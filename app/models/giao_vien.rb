class GiaoVien < ApplicationRecord
  self.table_name = "giao_vien"

  has_many :lop_mon_hocs, class_name: LopMonHoc.name
  has_many :chuyen_mons, class_name: ChuyenMon.name
  has_many :mon_hocs, through: :chuyen_mons, source: :mon_hoc
  has_one :tai_khoan_thitn, class_name: TaiKhoanThitn.name, as: :nguoi_dung
end
