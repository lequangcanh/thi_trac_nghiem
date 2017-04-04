class TaiKhoanThitn < ApplicationRecord
  self.table_name = "tai_khoan_thitn"

  belongs_to :nguoi_dung, polymorphic: true

  validates :ma_nguoi_dung, presence: true, uniqueness: true
end
