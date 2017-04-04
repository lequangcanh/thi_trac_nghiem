class TaiKhoanThitn < ApplicationRecord
  self.table_name = "tai_khoan_thitn"

  belongs_to :nguoi_dung, polymorphic: true
end
