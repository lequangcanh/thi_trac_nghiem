class SinhVien < ApplicationRecord
  has_many :bai_this, dependent: :destroy
  has_many :sinh_vien_lop_hoc_phans
  has_many :lop_hoc_phans, through: :sinh_vien_lop_hoc_phans
end
