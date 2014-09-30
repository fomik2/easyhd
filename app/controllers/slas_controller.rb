class SlasController < ApplicationController
  
  def new
    @sla = Sla.new
    @slas = Sla.all
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

  def destroy
    @sla = Sla.find(params[:id])
    @sla.destroy
    redirect_to new_sla_path
  end

private

  def sla_params
    params.require(:sla).permit(:sla_value, :time_for_deadline)
  end

end