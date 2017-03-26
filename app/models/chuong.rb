class Chuong < ApplicationRecord
  has_many :cau_hois
  belongs_to :mon_hoc
end
