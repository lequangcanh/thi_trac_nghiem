class BaiThi < ApplicationRecord
  has_many :bai_thi_chi_tiets, dependent: :destroy
  belongs_to :sinh_vien
  belongs_to :de_thi
end
