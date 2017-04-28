# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20170428041124) do

  create_table "bai_thi", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.integer  "de_thi_id"
    t.integer  "sinh_vien_id"
    t.datetime "gio_bat_dau"
    t.datetime "gio_nop_bai"
    t.integer  "so_cau_dung"
    t.float    "tong_diem",    limit: 24
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.integer  "trang_thai",              default: 0
    t.index ["de_thi_id"], name: "fk_rails_f72c001676", using: :btree
    t.index ["sinh_vien_id"], name: "fk_rails_7473fb064e", using: :btree
  end

  create_table "bai_thi_chi_tiet_cau_hoi", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.integer  "bai_thi_id"
    t.boolean  "tra_loi_dung"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.integer  "cau_hoi_id"
    t.index ["bai_thi_id"], name: "fk_rails_12b3e23e4c", using: :btree
  end

  create_table "bai_thi_chi_tiet_phuong_an", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.integer  "bai_thi_chi_tiet_cau_hoi_id"
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
    t.integer  "phuong_an_chon_id"
    t.index ["bai_thi_chi_tiet_cau_hoi_id"], name: "fk_rails_f416538f26", using: :btree
  end

  create_table "cau_hoi", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.integer  "giao_vien_id"
    t.text     "noi_dung",     limit: 65535
    t.integer  "do_kho"
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
    t.integer  "mon_hoc_id"
    t.index ["giao_vien_id"], name: "fk_rails_99bb2bd61a", using: :btree
    t.index ["mon_hoc_id"], name: "fk_rails_787755fd30", using: :btree
  end

  create_table "chuc_nang", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "ten_chuc_nang", limit: 50, null: false, collation: "utf8mb4_general_ci"
  end

  create_table "chuyen_mon", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.integer  "giao_vien_id"
    t.integer  "mon_hoc_id"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.index ["giao_vien_id"], name: "fk_rails_9d254a250e", using: :btree
    t.index ["mon_hoc_id"], name: "fk_rails_18bcc98659", using: :btree
  end

  create_table "ckeditor_assets", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.string   "data_file_name",               null: false
    t.string   "data_content_type"
    t.integer  "data_file_size"
    t.string   "type",              limit: 30
    t.integer  "width"
    t.integer  "height"
    t.datetime "created_at",                   null: false
    t.datetime "updated_at",                   null: false
    t.index ["type"], name: "index_ckeditor_assets_on_type", using: :btree
  end

  create_table "day_nha", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "ten", limit: 30, null: false, collation: "utf8mb4_general_ci"
  end

  create_table "de_thi", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.integer  "mon_hoc_id"
    t.string   "tieu_de"
    t.integer  "thoi_gian"
    t.integer  "so_cau_hoi"
    t.text     "theo_do_kho",       limit: 65535
    t.text     "theo_chuong",       limit: 65535
    t.datetime "created_at",                                      null: false
    t.datetime "updated_at",                                      null: false
    t.integer  "giao_vien_id"
    t.datetime "thoi_gian_mo_de"
    t.datetime "thoi_gian_dong_de"
    t.boolean  "xem_ket_qua",                     default: false
    t.index ["giao_vien_id"], name: "fk_rails_42449c7b66", using: :btree
    t.index ["mon_hoc_id"], name: "fk_rails_f608774188", using: :btree
  end

  create_table "de_thi_cau_hoi", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.integer  "de_thi_id"
    t.integer  "cau_hoi_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["cau_hoi_id"], name: "fk_rails_9ade6afedc", using: :btree
    t.index ["de_thi_id"], name: "fk_rails_fb64b96998", using: :btree
  end

  create_table "giang_duong", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string  "ma_giang_duong", limit: 10, null: false
    t.integer "tang",                      null: false
    t.string  "ten",            limit: 50, null: false, collation: "utf8mb4_general_ci"
    t.integer "day_nha_id",                null: false
    t.index ["day_nha_id"], name: "FKckqnivpykmcjh3aekpjgn834l", using: :btree
  end

  create_table "giao_vien", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string  "ho_dem",       limit: 50,                           null: false, collation: "utf8mb4_general_ci"
    t.string  "ten",          limit: 20,                           null: false, collation: "utf8mb4_general_ci"
    t.string  "ma_giao_vien", limit: 20,         default: "11111", null: false
    t.date    "ngay_sinh"
    t.text    "ho_khau",      limit: 4294967295,                                collation: "utf8mb4_general_ci"
    t.text    "quoc_tich",    limit: 4294967295,                                collation: "utf8mb4_general_ci"
    t.text    "dia_chi",      limit: 4294967295,                                collation: "utf8mb4_general_ci"
    t.text    "noi_sinh",     limit: 4294967295,                                collation: "utf8mb4_general_ci"
    t.text    "dan_toc",      limit: 4294967295,                                collation: "utf8mb4_general_ci"
    t.text    "dien_thoai",   limit: 4294967295,                                collation: "utf8mb4_general_ci"
    t.text    "email",        limit: 4294967295,                                collation: "utf8mb4_general_ci"
    t.text    "cmnd",         limit: 4294967295,                                collation: "utf8mb4_general_ci"
    t.date    "ngay_cap"
    t.text    "noi_cap",      limit: 4294967295,                                collation: "utf8mb4_general_ci"
    t.boolean "gioi_tinh"
    t.boolean "deleted"
  end

  create_table "khoa", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.text    "ten",     limit: 4294967295, collation: "utf8mb4_general_ci"
    t.boolean "deleted"
  end

  create_table "ki_hoc", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "ten", limit: 20, null: false, collation: "utf8mb4_general_ci"
  end

  create_table "ki_hoc_nam_hoc", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.datetime "ngay_bat_dau",  precision: 6, null: false
    t.datetime "ngay_ket_thuc", precision: 6, null: false
    t.integer  "ki_hoc_id",                   null: false
    t.integer  "nam_hoc_id",                  null: false
    t.index ["ki_hoc_id"], name: "FKreq7cxubb19him0kqjn7eo1nd", using: :btree
    t.index ["nam_hoc_id"], name: "FKpoctyq7eo25lfxtgt2wpa7k7p", using: :btree
  end

  create_table "lop_hoc", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string  "ma",          limit: 20, null: false
    t.string  "ten"
    t.integer "khoa_hoc_id"
    t.integer "khoa_id"
    t.boolean "deleted"
  end

  create_table "lop_mon_hoc", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer "so_tiet_ly_thuyet",                    null: false
    t.integer "so_tiet_thuc_hanh",                    null: false
    t.integer "giao_vien_id",                         null: false
    t.integer "ki_hoc_nam_hoc_id",                    null: false
    t.integer "mon_hoc_id",                           null: false
    t.integer "so_tin_chi"
    t.integer "ngay_hoc_1"
    t.integer "ngay_hoc_2"
    t.text    "tiet_hoc_1",        limit: 4294967295,              collation: "utf8mb4_general_ci"
    t.text    "tiet_hoc_2",        limit: 4294967295,              collation: "utf8mb4_general_ci"
    t.date    "ngay_bat_dau"
    t.integer "so_luong_toi_da"
    t.integer "so_luong_dang_ky"
    t.boolean "deleted"
    t.integer "de_thi_gk_id"
    t.integer "de_thi_ck_id"
    t.integer "de_thi_thu_id"
    t.index ["giao_vien_id"], name: "FK9docpcq7n4qdsg56s7y265xun", using: :btree
    t.index ["ki_hoc_nam_hoc_id"], name: "FKp4njw4anxx283rpfh99gf8hg4", using: :btree
    t.index ["mon_hoc_id"], name: "FK9myvf12yau7oi2eh40q1ekgaa", using: :btree
  end

  create_table "lop_mon_hoc_sinh_vien", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer "lop_mon_hoc_id",                          null: false
    t.integer "sinh_vien_id",                            null: false
    t.boolean "da_nop"
    t.decimal "diem_cc",        precision: 18, scale: 1
    t.decimal "diem_gk",        precision: 18, scale: 1
    t.decimal "diem_ck1",       precision: 18, scale: 1
    t.decimal "diem_ck2",       precision: 18, scale: 1
    t.boolean "deleted"
    t.index ["lop_mon_hoc_id"], name: "FKr1aoie8v3bvf0mqbrfkwunepj", using: :btree
    t.index ["sinh_vien_id"], name: "FKogw9ibvturwchdidqtr4k5b8h", using: :btree
  end

  create_table "mon_hoc", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "ma_mon_hoc", limit: 10, null: false
    t.string "ten",        limit: 30, null: false, collation: "utf8mb4_general_ci"
  end

  create_table "mon_hoc_giang_duong", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer "giang_duong_id", null: false
    t.integer "mon_hoc_id",     null: false
    t.index ["giang_duong_id"], name: "FK2x5eme4cpk1829voops1axe5s", using: :btree
    t.index ["mon_hoc_id"], name: "FKpfreenpbmwv9yex1adkykkp2g", using: :btree
  end

  create_table "nam_hoc", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "name",          limit: 10,               null: false
    t.datetime "ngay_bat_dau",             precision: 6
    t.datetime "ngay_ket_thuc",            precision: 6
  end

  create_table "phuong_an", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.integer  "cau_hoi_id"
    t.text     "phuong_an",   limit: 65535
    t.boolean  "dap_an_dung"
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
    t.index ["cau_hoi_id"], name: "fk_rails_7882c07443", using: :btree
  end

  create_table "sinh_vien", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string  "ho_dem",         limit: 50,         null: false, collation: "utf8mb4_general_ci"
    t.string  "ma_sinh_vien",   limit: 25,         null: false
    t.string  "ten",            limit: 20,         null: false, collation: "utf8mb4_general_ci"
    t.integer "lop_hoc_id",                        null: false
    t.integer "khoa_hoc_id"
    t.date    "ngay_sinh"
    t.text    "ho_khau",        limit: 4294967295,              collation: "utf8mb4_general_ci"
    t.text    "quoc_tich",      limit: 4294967295,              collation: "utf8mb4_general_ci"
    t.text    "dia_chi",        limit: 4294967295,              collation: "utf8mb4_general_ci"
    t.text    "noi_sinh",       limit: 4294967295,              collation: "utf8mb4_general_ci"
    t.text    "dan_toc",        limit: 4294967295,              collation: "utf8mb4_general_ci"
    t.text    "dien_thoai",     limit: 4294967295,              collation: "utf8mb4_general_ci"
    t.text    "email",          limit: 4294967295,              collation: "utf8mb4_general_ci"
    t.text    "cmnd",           limit: 4294967295,              collation: "utf8mb4_general_ci"
    t.date    "ngay_cap"
    t.text    "noi_cap",        limit: 4294967295,              collation: "utf8mb4_general_ci"
    t.text    "ho_ten_cha",     limit: 4294967295,              collation: "utf8mb4_general_ci"
    t.text    "ho_ten_me",      limit: 4294967295,              collation: "utf8mb4_general_ci"
    t.text    "dien_thoai_cha", limit: 4294967295,              collation: "utf8mb4_general_ci"
    t.text    "dien_thoai_me",  limit: 4294967295,              collation: "utf8mb4_general_ci"
    t.boolean "gioi_tinh"
    t.integer "khoa_id"
    t.boolean "deleted"
    t.index ["lop_hoc_id"], name: "FKcvefby2d9tr0tkik204mm1ruu", using: :btree
  end

  create_table "tai_khoan_he_thong", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "ho_va_ten",     limit: 70, null: false, collation: "utf8mb4_general_ci"
    t.string "mat_khau",      limit: 50, null: false
    t.string "ten_dang_nhap", limit: 20, null: false
  end

  create_table "tai_khoan_he_thong_vai_tro", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer "tai_khoan_he_thong_id"
    t.integer "vai_tro_id"
    t.index ["tai_khoan_he_thong_id"], name: "FKan2beftsii0ycmbxyy7eijdbo", using: :btree
    t.index ["vai_tro_id"], name: "FKenbt8fd3hj80somc9bjpyvb4c", using: :btree
  end

  create_table "tai_khoan_thitn", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.string   "ma_nguoi_dung"
    t.string   "password"
    t.string   "nguoi_dung_type"
    t.integer  "nguoi_dung_id"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  create_table "tkb_lich_hoc_theo_ngay", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.datetime "ngay",                              precision: 6
    t.integer  "giang_duong_id",                                                  null: false
    t.integer  "lop_mon_hoc_id",                                                  null: false
    t.integer  "tkb_thu_id",                                                      null: false
    t.integer  "tkb_tiet_cuoi_cung_id",                                           null: false
    t.integer  "tkb_tiet_dau_tien_id",                                            null: false
    t.boolean  "thi_cuoi_ky",                                     default: false, null: false
    t.boolean  "thi_giua_ky",                                     default: false, null: false
    t.string   "giao_vien_nhan",        limit: 500,                                            collation: "utf8mb4_general_ci"
    t.index ["giang_duong_id"], name: "FK5lkvd1fgnricunootplp1rwx5", using: :btree
    t.index ["lop_mon_hoc_id"], name: "FKb2wrvoaeevlljb10i99vwhaks", using: :btree
    t.index ["tkb_thu_id"], name: "FKri4tuosa4rgbrhdrbkim716qg", using: :btree
    t.index ["tkb_tiet_cuoi_cung_id"], name: "FK1yqbqahyisn3x9qs2p5db8p9e", using: :btree
    t.index ["tkb_tiet_dau_tien_id"], name: "FKsu2nn7gjf8tvmnsnx2kp2p1uw", using: :btree
  end

  create_table "tkb_thu", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "ten", limit: 20, null: false, collation: "utf8mb4_general_ci"
  end

  create_table "tkb_tiet", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "ten", limit: 20, null: false, collation: "utf8mb4_general_ci"
  end

  create_table "vai_tro", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "ten_vai_tro", limit: 20, null: false, collation: "utf8mb4_general_ci"
  end

  create_table "vai_tro_chuc_nang", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer "chuc_nang_id", null: false
    t.integer "vai_tro_id",   null: false
    t.index ["chuc_nang_id"], name: "FKqg9ikqmrba6ly2ljuh8ic7s32", using: :btree
    t.index ["vai_tro_id"], name: "FKocpeg9t4iu1yeoju8opqet2cd", using: :btree
  end

  add_foreign_key "bai_thi", "de_thi"
  add_foreign_key "bai_thi", "sinh_vien"
  add_foreign_key "bai_thi_chi_tiet_cau_hoi", "bai_thi"
  add_foreign_key "bai_thi_chi_tiet_phuong_an", "bai_thi_chi_tiet_cau_hoi"
  add_foreign_key "cau_hoi", "giao_vien"
  add_foreign_key "cau_hoi", "mon_hoc"
  add_foreign_key "chuyen_mon", "giao_vien"
  add_foreign_key "chuyen_mon", "mon_hoc"
  add_foreign_key "de_thi", "giao_vien"
  add_foreign_key "de_thi", "mon_hoc"
  add_foreign_key "de_thi_cau_hoi", "cau_hoi"
  add_foreign_key "de_thi_cau_hoi", "de_thi"
  add_foreign_key "giang_duong", "day_nha", name: "FKckqnivpykmcjh3aekpjgn834l"
  add_foreign_key "ki_hoc_nam_hoc", "ki_hoc", name: "FKreq7cxubb19him0kqjn7eo1nd"
  add_foreign_key "ki_hoc_nam_hoc", "nam_hoc", name: "FKpoctyq7eo25lfxtgt2wpa7k7p"
  add_foreign_key "lop_mon_hoc", "giao_vien", name: "FK9docpcq7n4qdsg56s7y265xun"
  add_foreign_key "lop_mon_hoc", "ki_hoc_nam_hoc", name: "FKp4njw4anxx283rpfh99gf8hg4"
  add_foreign_key "lop_mon_hoc", "mon_hoc", name: "FK9myvf12yau7oi2eh40q1ekgaa"
  add_foreign_key "lop_mon_hoc_sinh_vien", "lop_mon_hoc", name: "FKr1aoie8v3bvf0mqbrfkwunepj"
  add_foreign_key "lop_mon_hoc_sinh_vien", "sinh_vien", name: "FKogw9ibvturwchdidqtr4k5b8h"
  add_foreign_key "mon_hoc_giang_duong", "giang_duong", name: "FK2x5eme4cpk1829voops1axe5s"
  add_foreign_key "mon_hoc_giang_duong", "mon_hoc", name: "FKpfreenpbmwv9yex1adkykkp2g"
  add_foreign_key "phuong_an", "cau_hoi"
  add_foreign_key "sinh_vien", "lop_hoc", name: "FKcvefby2d9tr0tkik204mm1ruu"
  add_foreign_key "tai_khoan_he_thong_vai_tro", "tai_khoan_he_thong", name: "FKan2beftsii0ycmbxyy7eijdbo"
  add_foreign_key "tai_khoan_he_thong_vai_tro", "vai_tro", name: "FKenbt8fd3hj80somc9bjpyvb4c"
  add_foreign_key "tkb_lich_hoc_theo_ngay", "giang_duong", name: "FK5lkvd1fgnricunootplp1rwx5"
  add_foreign_key "tkb_lich_hoc_theo_ngay", "lop_mon_hoc", name: "FKb2wrvoaeevlljb10i99vwhaks"
  add_foreign_key "tkb_lich_hoc_theo_ngay", "tkb_thu", name: "FKri4tuosa4rgbrhdrbkim716qg"
  add_foreign_key "tkb_lich_hoc_theo_ngay", "tkb_tiet", column: "tkb_tiet_cuoi_cung_id", name: "FK1yqbqahyisn3x9qs2p5db8p9e"
  add_foreign_key "tkb_lich_hoc_theo_ngay", "tkb_tiet", column: "tkb_tiet_dau_tien_id", name: "FKsu2nn7gjf8tvmnsnx2kp2p1uw"
  add_foreign_key "vai_tro_chuc_nang", "chuc_nang", name: "FKqg9ikqmrba6ly2ljuh8ic7s32"
  add_foreign_key "vai_tro_chuc_nang", "vai_tro", name: "FKocpeg9t4iu1yeoju8opqet2cd"
end
