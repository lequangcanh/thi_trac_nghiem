class LopMonHoc < ApplicationRecord
  self.table_name = "lop_mon_hoc"

  has_many :lop_mon_hoc_sinh_viens, class_name: LopMonHocSinhVien.name
  has_many :sinh_viens, through: :lop_mon_hoc_sinh_viens, source: :sinh_vien
  has_one :de_thi_gk, class_name: DeThi.name, foreign_key: :id,
    primary_key: :de_thi_gk_id
  has_one :de_thi_ck, class_name: DeThi.name, foreign_key: :id,
    primary_key: :de_thi_ck_id
  has_one :de_thi_thu, class_name: DeThi.name, foreign_key: :id,
    primary_key: :de_thi_thu_id
  belongs_to :giao_vien, class_name: GiaoVien.name
  belongs_to :mon_hoc, class_name: MonHoc.name

  def ma_lop_mon_hoc
    self.mon_hoc.ma_mon_hoc + "." + self.id.to_s
  end
end
