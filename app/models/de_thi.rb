class DeThi < ApplicationRecord
  self.table_name = "de_thi"

  belongs_to :mon_hoc, class_name: MonHoc.name
  belongs_to :giao_vien, class_name: GiaoVien.name
  has_many :de_thi_cau_hois, class_name: DeThiCauHoi.name, dependent: :destroy
  has_many :cau_hois, through: :de_thi_cau_hois, source: :cau_hoi
  has_many :bai_this, class_name: BaiThi.name, dependent: :destroy

  validates :tieu_de, presence: true
  validates :thoi_gian, presence: true
  validates :so_cau_hoi, presence: true
  validates :thoi_gian_mo_de, presence: true
  validates :thoi_gian_dong_de, presence: true

  scope :newest, ->{order created_at: :desc}

  def dang_mo
    (self.thoi_gian_mo_de <= Time.now) && (self.thoi_gian_dong_de >= Time.now)
  end
end
