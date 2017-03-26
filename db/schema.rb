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

ActiveRecord::Schema.define(version: 20170325164634) do

  create_table "bai_thi_chi_tiets", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "cau_hoi_id"
    t.text     "sinh_vien_chon", limit: 65535
    t.string   "dap_an"
    t.integer  "bai_thi_id"
    t.datetime "created_at",                   null: false
    t.datetime "updated_at",                   null: false
    t.index ["bai_thi_id"], name: "index_bai_thi_chi_tiets_on_bai_thi_id", using: :btree
  end

  create_table "bai_this", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.date     "gio_bat_dat"
    t.date     "gio_nop_bai"
    t.integer  "so_cau_dung"
    t.float    "tong_diem",    limit: 24
    t.integer  "de_thi_id"
    t.integer  "sinh_vien_id"
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
    t.index ["de_thi_id"], name: "index_bai_this_on_de_thi_id", using: :btree
    t.index ["sinh_vien_id"], name: "index_bai_this_on_sinh_vien_id", using: :btree
  end

  create_table "cau_hois", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.text     "noi_dung",      limit: 65535
    t.integer  "do_kho"
    t.integer  "chuong_id"
    t.integer  "giang_vien_id"
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
    t.index ["chuong_id"], name: "index_cau_hois_on_chuong_id", using: :btree
    t.index ["giang_vien_id"], name: "index_cau_hois_on_giang_vien_id", using: :btree
  end

  create_table "chuongs", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "ten"
    t.text     "noi_dung_chinh", limit: 65535
    t.integer  "mon_hoc_id"
    t.datetime "created_at",                   null: false
    t.datetime "updated_at",                   null: false
    t.index ["mon_hoc_id"], name: "index_chuongs_on_mon_hoc_id", using: :btree
  end

  create_table "chuyen_mons", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "giang_vien_id"
    t.integer  "mon_hoc_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.index ["giang_vien_id"], name: "index_chuyen_mons_on_giang_vien_id", using: :btree
    t.index ["mon_hoc_id"], name: "index_chuyen_mons_on_mon_hoc_id", using: :btree
  end

  create_table "de_thi_cau_hois", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "de_thi_id"
    t.integer  "cau_hoi_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["cau_hoi_id"], name: "index_de_thi_cau_hois_on_cau_hoi_id", using: :btree
    t.index ["de_thi_id"], name: "index_de_thi_cau_hois_on_de_thi_id", using: :btree
  end

  create_table "de_this", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "tieu_de"
    t.integer  "thoi_gian"
    t.integer  "so_cau_hoi"
    t.text     "theo_do_kho",      limit: 65535
    t.text     "theo_chuong",      limit: 65535
    t.date     "ngay_bat_dau_thi"
    t.integer  "trang_thai"
    t.integer  "mon_hoc_id"
    t.datetime "created_at",                     null: false
    t.datetime "updated_at",                     null: false
    t.index ["mon_hoc_id"], name: "index_de_this_on_mon_hoc_id", using: :btree
  end

  create_table "giang_viens", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "msgv"
    t.string   "password"
    t.string   "ho"
    t.string   "ten"
    t.string   "email"
    t.string   "sdt"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "lop_hoc_phans", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "ten"
    t.integer  "trang_thai"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "mon_hocs", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "ten"
    t.integer  "so_tin_chi"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "phuong_ans", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.text     "phuong_an",  limit: 65535
    t.boolean  "dap_an"
    t.integer  "cau_hoi_id"
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
    t.index ["cau_hoi_id"], name: "index_phuong_ans_on_cau_hoi_id", using: :btree
  end

  create_table "sinh_vien_lop_hoc_phans", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "sinh_vien_id"
    t.integer  "lop_hoc_phan_id"
    t.boolean  "cam_thi"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.index ["lop_hoc_phan_id"], name: "index_sinh_vien_lop_hoc_phans_on_lop_hoc_phan_id", using: :btree
    t.index ["sinh_vien_id"], name: "index_sinh_vien_lop_hoc_phans_on_sinh_vien_id", using: :btree
  end

  create_table "sinh_viens", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "mssv"
    t.string   "password"
    t.string   "ho"
    t.string   "ten"
    t.string   "ngay_sinh"
    t.string   "cmnd"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "bai_thi_chi_tiets", "bai_this"
  add_foreign_key "bai_this", "de_this"
  add_foreign_key "bai_this", "sinh_viens"
  add_foreign_key "cau_hois", "chuongs"
  add_foreign_key "cau_hois", "giang_viens"
  add_foreign_key "chuongs", "mon_hocs"
  add_foreign_key "chuyen_mons", "giang_viens"
  add_foreign_key "chuyen_mons", "mon_hocs"
  add_foreign_key "de_thi_cau_hois", "cau_hois"
  add_foreign_key "de_thi_cau_hois", "de_this"
  add_foreign_key "de_this", "mon_hocs"
  add_foreign_key "phuong_ans", "cau_hois"
  add_foreign_key "sinh_vien_lop_hoc_phans", "lop_hoc_phans"
  add_foreign_key "sinh_vien_lop_hoc_phans", "sinh_viens"
end
