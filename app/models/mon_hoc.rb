class MonHoc < ApplicationRecord
  has_many :chuyen_mons
  has_many :giang_viens, through: :chuyen_mons
  has_many :chuongs
  has_many :de_this
end
