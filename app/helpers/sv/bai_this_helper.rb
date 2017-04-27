module Sv::BaiThisHelper
  def check_time_out bai_thi
    gio_bat_dau = bai_thi.gio_bat_dau
    thoi_gian_dong_de = bai_thi.de_thi.thoi_gian_dong_de
    if TimeDifference.between(gio_bat_dau, thoi_gian_dong_de).in_hours > 1
      bai_thi.de_thi.thoi_gian * 60
    elsif TimeDifference.between(gio_bat_dau, thoi_gian_dong_de).in_minutes > bai_thi.de_thi.thoi_gian
      bai_thi.de_thi.thoi_gian * 60
    else
      TimeDifference.between(gio_bat_dau, thoi_gian_dong_de).in_seconds.round
    end
  end
end
