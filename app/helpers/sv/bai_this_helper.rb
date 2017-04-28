module Sv::BaiThisHelper
  def check_time_out bai_thi
    gio_bat_dau = Time.now
    thoi_gian_dong_de = bai_thi.de_thi.thoi_gian_dong_de
    if TimeDifference.between(gio_bat_dau, thoi_gian_dong_de).in_hours > 1
      bai_thi.thoi_gian_con_lai
    elsif TimeDifference.between(gio_bat_dau, thoi_gian_dong_de).in_minutes > bai_thi.thoi_gian_con_lai
      bai_thi.thoi_gian_con_lai
    else
      TimeDifference.between(gio_bat_dau, thoi_gian_dong_de).in_seconds.round
    end
  end
end
