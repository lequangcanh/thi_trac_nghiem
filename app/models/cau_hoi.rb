class CauHoi < ApplicationRecord
  self.table_name = "cau_hoi"

  belongs_to :mon_hoc, class_name: MonHoc.name
  belongs_to :giao_vien, class_name: GiaoVien.name
  has_many :phuong_ans, class_name: PhuongAn.name, dependent: :destroy, inverse_of: :cau_hoi
  has_many :de_thi_cau_hois, class_name: DeThiCauHoi.name
  has_many :de_this, through: :de_thi_cau_hois, source: :de_thi

  accepts_nested_attributes_for :phuong_ans, allow_destroy: true, reject_if: :all_blank

  enum do_kho: {nho: 1, hieu: 2, phan_tich: 3, van_dung: 4, tong_hop: 5}

  validates :noi_dung, presence: true

  scope :newest, ->{order created_at: :desc}
end
