class Admin::OrderDetailsController < ApplicationController
  before_action :authenticate_admin!

  def update
    order_detail = OrderDetail.find(params[:id])
    order_detail.update(order_detail_params)
    flash[:notice] = "ステータスを変更しました。"
    case order_detail.making_status
    when "in_the_making"
      order_detail.order.update(status: "in_the_making")
      flash[:notice] = "ステータスを変更しました。"
    when "completed"
      if order_detail.order.order_details.all?{|order_detail| order_detail.making_status == "completed"}
        order_detail.order.update(status: "shipping_preparation")
        flash[:notice] = "ステータスを変更しました。発送準備をしてください。"
      end
    end
    redirect_to admin_order_path(order_detail.order.id)
  end

private
  def order_detail_params
    params.require(:order_detail).permit(:making_status)
  end
end
