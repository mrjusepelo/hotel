class Api::V1::ReservesController < ApiController

  def index
    @reserves = Reserve.all
  end

  def create
    @reserve = Reserve.new permit_parmas
    if @reserve.save
      render status: 200, json: { message: "Registro creado correctamente." }
    else
      render status: 411, json: {message: @reserve.errors.full_messages.to_sentence}
    end
  end

  def update
    @reserve = Reserve.find params[:id]
    if @reserve.update permit_parmas
      discount = @reserve.user.member_level*10
      room_value = @reserve.room.price * (@reserve.end_date.to_date - Date.today).to_i
      subtotal = (room_value) + params[:minibar_value].to_f
      total = subtotal - (discount * discount.to_f/100.0 )
      invoice = @reserve.invoices.create(room_value: room_value, minibar_value: params[:minibar_value], discount: discount, total: total)
      render status: 200, json: { message: "Registro actualizado correctamente.", reserve: @reserve.as_json, invoice: invoice.as_json }
    else
      render status: 411, json: {message: @reserve.errors.full_messages.to_sentence}
    end
  end




  private
  def permit_parmas
    params.require(:reserve).permit(:start_date, :end_date, :user_id, :room_id)
  end

end
