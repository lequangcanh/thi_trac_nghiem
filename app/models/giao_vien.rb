class GiaoVien < ApplicationRecord
  self.table_name = "giao_vien"

  has_many :lop_mon_hocs, class_name: LopMonHoc.name
  has_many :mon_hocs, through: :lop_mon_hocs, source: :mon_hoc
  has_one :tai_khoan_thitn, class_name: TaiKhoanThitn.name, as: :nguoi_dung
  has_many :cau_hois, class_name: CauHoi.name
  has_many :de_this, class_name: DeThi.name

  validates :ma_giao_vien, presence: true, uniqueness: true

  def ho_ten_day_du
    self.ho_dem + " " + self.ten
  end

  def is_giao_vien? giao_vien
    self == giao_vien
  end
end
