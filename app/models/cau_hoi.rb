class CauHoi < ApplicationRecord
  self.table_name = "cau_hoi"

  belongs_to :mon_hoc, class_name: MonHoc.name
  belongs_to :giao_vien, class_name: GiaoVien.name
  has_many :phuong_ans, class_name: PhuongAn.name, dependent: :destroy, inverse_of: :cau_hoi
  has_many :de_thi_cau_hois, class_name: DeThiCauHoi.name, dependent: :destroy
  has_many :de_this, through: :de_thi_cau_hois, source: :de_thi

  accepts_nested_attributes_for :phuong_ans, allow_destroy: true, reject_if: :all_blank

  enum do_kho: {nho: 1, hieu: 2, phan_tich: 3, van_dung: 4, tong_hop: 5}, _prefix: true

  validates :noi_dung, presence: true

  scope :newest, ->{order created_at: :desc}
  scope :tong_cau_nho, ->{where do_kho: :nho}
  scope :tong_cau_hieu, ->{where do_kho: :hieu}
  scope :tong_cau_phan_tich, ->{where do_kho: :phan_tich}
  scope :tong_cau_van_dung, ->{where do_kho: :van_dung}
  scope :tong_cau_tong_hop, ->{where do_kho: :tong_hop}
end
