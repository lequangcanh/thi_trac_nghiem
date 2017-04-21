class BaiThiChiTietPhuongAn < ApplicationRecord
  self.table_name = "bai_thi_chi_tiet_phuong_an"

  belongs_to :bai_thi_chi_tiet_cau_hoi, class_name: BaiThiChiTietCauHoi.name
  has_one :phuong_an, class_name: PhuongAn.name, foreign_key: :id, primary_key: :phuong_an_chon_id

  scope :phuong_an_chon_ids, -> cau_hoi_id do
    where(bai_thi_chi_tiet_cau_hoi_id: cau_hoi_id).pluck :phuong_an_chon_id
  end
end
