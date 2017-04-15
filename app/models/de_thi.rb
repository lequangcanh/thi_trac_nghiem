class DeThi < ApplicationRecord
  self.table_name = "de_thi"

  belongs_to :mon_hoc, class_name: MonHoc.name
  belongs_to :giao_vien, class_name: GiaoVien.name
  has_many :de_thi_cau_hois, class_name: DeThiCauHoi.name, dependent: :destroy
  has_many :cau_hois, through: :de_thi_cau_hois, source: :cau_hoi
  has_many :bai_this, class_name: BaiThi.name

  enum trang_thai: {close: 0, open: 1}, _prefix: true

  scope :newest, ->{order created_at: :desc}
  scope :de_thi_dang_mo, ->{where trang_thai: 1}

  validates :tieu_de, presence: true
  validates :thoi_gian, presence: true
  validates :so_cau_hoi, presence: true
end
