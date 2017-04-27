module Gv::DeThisHelper
  def get_status de_thi
    if (Time.now > de_thi.thoi_gian_mo_de && Time.now < de_thi.thoi_gian_dong_de)
      content_tag :span, class: "label label-success" do
        t ".opening"
      end
    else
      content_tag :span, class: "label label-danger" do
        t ".closing"
      end
    end
  end
end
