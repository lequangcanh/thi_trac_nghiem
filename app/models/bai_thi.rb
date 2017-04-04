class BaiThi < ApplicationRecord
  self.table_name = "bai_thi"

  belongs_to :de_thi, class_name: DeThi.name
  belongs_to :sinh_vien, class_name: SinhVien.name
  has_many :bai_thi_chi_tiet_cau_hois, class_name: BaiThiChiTietCauHoi.name
end
