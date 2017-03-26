class CauHoi < ApplicationRecord
  has_many :de_thi_cau_hois
  has_many :de_this, through: :de_thi_cau_hois
  belongs_to :giang_vien
  has_many :phuong_ans, dependent: :destroy
  belongs_to :chuongs
end
