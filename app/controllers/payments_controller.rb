class PaymentsController < ApplicationController

  def success
    @racquet = Racquet.find(params[:racquetId])
    @user = User.find(params[:userId]).user_detail
  end

end