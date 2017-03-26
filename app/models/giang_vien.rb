class GiangVien < ApplicationRecord
  has_many :lop_hoc_phans
  has_many :cau_hois
  has_many :chuyen_mons
  has_many :mon_hocs, through: :chuyen_mons
end
