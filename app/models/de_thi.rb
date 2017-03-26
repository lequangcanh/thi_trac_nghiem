class DeThi < ApplicationRecord
  has_many :bai_this
  has_many :de_thi_cau_hois
  has_many :cau_hois, through: :de_thi_cau_hois
  belongs_to :mon_hoc
end
