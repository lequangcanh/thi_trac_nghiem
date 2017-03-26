require "ffaker"


namespace :db do
  desc "Seeding data"
  task seeding: :environment do
    if Rails.env.production?
      puts "Do not running in 'Production' task"
    else
      %w[db:drop db:create db:migrate db:seed].each do |task|
        Rake::Task[task].invoke
      end

      puts "Create sinh vien"
      SinhVien.create mssv: "sv_1001", ho: "Le", ten: "A"
      SinhVien.create mssv: "sv_1002", ho: "Nguyen", ten: "B"
      SinhVien.create mssv: "sv_1003", ho: "Le", ten: "Loi"

      puts "Create mon hoc"
      MonHoc.create ten: "Toan dai cuong", so_tin_chi: 4
      MonHoc.create ten: "Anh Van chuyen nganh", so_tin_chi: 2
      MonHoc.create ten: "Vat ly dai cuong", so_tin_chi: 3

      puts "Create giang vien"
      GiangVien.create msgv: "gv_1001", ho: "Nguyen", ten: "Anh"
      GiangVien.create msgv: "gv_1002", ho: "Le", ten: "Anh"
      GiangVien.create msgv: "gv_1003", ho: "Le", ten: "Binh"

      puts "Create chuyen mon"
      ChuyenMon.create giang_vien_id: 1, mon_hoc_id: 1
      ChuyenMon.create giang_vien_id: 1, mon_hoc_id: 3
      ChuyenMon.create giang_vien_id: 2, mon_hoc_id: 2
      ChuyenMon.create giang_vien_id: 3, mon_hoc_id: 1

      puts "Create Lop hoc phan"
      LopHocPhan.create ten: "Toan dai cuong 12N10", mon_hoc_id: 1, giang_vien_id: 1
      LopHocPhan.create ten: "Toan dai cuong 12N11", mon_hoc_id: 1, giang_vien_id: 1
      LopHocPhan.create ten: "Vat ly dai cuong 12N10", mon_hoc_id: 3, giang_vien_id: 1
      LopHocPhan.create ten: "Anh van dai cuong 12N10", mon_hoc_id: 2, giang_vien_id: 2

      puts "Create sinh vien thuoc lop hoc phan"
      SinhVienLopHocPhan.create sinh_vien_id: 1, lop_hoc_phan_id: 1, cam_thi: false
      SinhVienLopHocPhan.create sinh_vien_id: 2, lop_hoc_phan_id: 1, cam_thi: true
      SinhVienLopHocPhan.create sinh_vien_id: 2, lop_hoc_phan_id: 2, cam_thi: false
      SinhVienLopHocPhan.create sinh_vien_id: 3, lop_hoc_phan_id: 3, cam_thi: false
    end
  end
end
