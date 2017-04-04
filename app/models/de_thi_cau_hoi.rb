class DeThiCauHoi < ApplicationRecord
  self.table_name = "de_thi_cau_hoi"

  belongs_to :de_thi, class_name: DeThi.name
  belongs_to :cau_hoi, class_name: CauHoi.name
end
