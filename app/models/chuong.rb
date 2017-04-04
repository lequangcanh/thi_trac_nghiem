class Chuong < ApplicationRecord
  self.table_name = "chuong"

  belongs_to :mon_hoc, class_name: MonHoc.name
  has_many :cau_hois, class_name: CauHoi.name
end
