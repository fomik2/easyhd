class SlasController < ApplicationController
  
  def new
    @sla = Sla.new
  end
  
  def create
    @sla = Sla.create(sla_params)
    if @sla.save
      redirect_to action: 'new'
    else 
      flash[:notice] = "Не сохранилось"
      redirect_to action: 'new'
    end
  end

private

  def sla_params
    params.require(:sla).permit(:sla_value, :time_for_deadline)
  end

end