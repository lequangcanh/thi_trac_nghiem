class BaiThi < ApplicationRecord
  self.table_name = "bai_thi"

  belongs_to :de_thi, class_name: DeThi.name
  belongs_to :sinh_vien, class_name: SinhVien.name
  has_many :bai_thi_chi_tiet_cau_hois, class_name: BaiThiChiTietCauHoi.name

  enum trang_thai: {unmake: 0, doing: 1, done: 2}, _prefix: true

  scope :de_thi_ids, ->{self.pluck(:de_thi_id)}
end
