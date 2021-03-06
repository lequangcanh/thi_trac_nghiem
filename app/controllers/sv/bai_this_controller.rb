class Sv::BaiThisController < Sv::BaseController
  before_action :logged_in_sinh_vien
  before_action :find_de_thi, only: :create
  before_action :find_bai_thi, only: [:show, :update]

  def create
    BaiThiChiTietCauHoi.transaction do
      if current_sinh_vien.bai_this.de_thi_ids.include? @de_thi.id
        flash[:danger] = t ".done_exam"
        redirect_to sv_root_path
      else
        @bai_thi = @de_thi.bai_this.build sinh_vien: current_sinh_vien,
          gio_bat_dau: Time.now, trang_thai: 1,
          thoi_gian_con_lai: @de_thi.thoi_gian * 60
        if @bai_thi.save
          @de_thi.cau_hois.shuffle.each do |cau_hoi|
            @bai_thi.bai_thi_chi_tiet_cau_hois.create! cau_hoi_id: cau_hoi.id
          end
          redirect_to sv_bai_thi_path(@bai_thi)
        else
          flash[:danger] = t ".fail"
          redirect_to sv_root_path
        end
      end
    end
  rescue => exception
    flash[:danger] = t ".fail"
    redirect_to sv_root_path
  end

  def show
  end

  def update
    bai_thi_chi_tiet = JSON.parse(params[:bai_thi])
    bai_thi_chi_tiet.each do |cau_hoi_id, phuong_an_chon|
      update_bai_thi_chi_tiet_phuong_an @bai_thi, cau_hoi_id, phuong_an_chon
      update_bai_thi_chi_tiet_cau_hoi @bai_thi, cau_hoi_id, phuong_an_chon
    end
    if params[:type] == "submit"
      so_cau_dung = @bai_thi.bai_thi_chi_tiet_cau_hois.tong_cau_dung
      tong_diem = ((so_cau_dung.to_f / @bai_thi.de_thi.so_cau_hoi) * 10).round(2)
      @bai_thi.update_attributes gio_nop_bai: Time.now, trang_thai: 2,
        so_cau_dung: so_cau_dung, tong_diem: tong_diem,
        thoi_gian_con_lai: params[:remain_time]
      respond_to do |format|
        format.json {render json: {type: "submit",
          so_cau_dung: "#{so_cau_dung} / #{@bai_thi.de_thi.so_cau_hoi}",
          tong_diem: tong_diem}}
      end
    else
      @bai_thi.update_attributes thoi_gian_con_lai: params[:remain_time]
      respond_to do |format|
        format.json {render json: {type: "auto"}}
      end
    end
  end

  private

  def find_de_thi
    @de_thi = DeThi.find_by id: params[:de_thi_id]
    unless @de_thi
      flash[:danger] = t ".de_thi_not_found"
      redirect_to sv_root_path
    end
  end

  def find_bai_thi
    @bai_thi = BaiThi.find_by id: params[:id]
    if @bai_thi.nil?
      flash[:danger] = t ".bai_thi_not_found"
      redirect_to sv_root_path
    elsif @bai_thi.trang_thai_done?
      flash[:danger] = t ".done_exam"
      redirect_to sv_root_path
    end
  end

  def update_bai_thi_chi_tiet_phuong_an bai_thi, cau_hoi_id, phuong_an_chon
    btctch = bai_thi.bai_thi_chi_tiet_cau_hois.find_by cau_hoi_id: cau_hoi_id
    if phuong_an_chon.any?
      phuong_an_chon.each do |phuong_an|
        btctch.bai_thi_chi_tiet_phuong_ans.create phuong_an_chon_id: phuong_an
      end
    end
  end

  def update_bai_thi_chi_tiet_cau_hoi bai_thi, cau_hoi_id, phuong_an_chon
    btctch = bai_thi.bai_thi_chi_tiet_cau_hois.find_by cau_hoi_id: cau_hoi_id
    if phuong_an_chon.sort == btctch.cau_hoi.phuong_ans.phuong_an_dung.sort
      btctch.update_attributes tra_loi_dung: true
    end
  end
end
