class GiaoVien < ApplicationRecord
  self.table_name = "giao_vien"

  has_many :lop_mon_hocs, class_name: LopMonHoc.name
  has_many :chuyen_mons, class_name: ChuyenMon.name
  has_many :mon_hocs, through: :chuyen_mons, source: :mon_hoc
  has_one :tai_khoan_thitn, class_name: TaiKhoanThitn.name, as: :nguoi_dung
  has_many :cau_hois, class_name: CauHoi.name

  validates :ma_giao_vien, presence: true, uniqueness: true

  def ho_ten_day_du
    self.ho_dem + " " + self.ten
  end
end
