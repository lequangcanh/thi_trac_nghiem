class LopHocPhan < ApplicationRecord
  has_many :sinh_vien_lop_hoc_phans
  has_many :sinh_viens, through: :sinh_vien_lop_hoc_phans
  belongs_to :giang_vien
  belongs_to :mon_hoc
end
