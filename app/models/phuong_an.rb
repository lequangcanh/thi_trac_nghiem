class PhuongAn < ApplicationRecord
  self.table_name = "phuong_an"

  belongs_to :cau_hoi, class_name: CauHoi.name
end