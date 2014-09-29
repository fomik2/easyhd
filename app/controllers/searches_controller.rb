class SearchesController < ApplicationController
  
  def new
    @search = Search.new
  end

  def create
    @search = Search.create(search_params)
    redirect_to @search
  end
  
  def show

    # присваиваем только что созданные параметры поиска переменной @search
    @search = Search.find(params[:id])
    
    # присваиваем результат работы метода requests (отбор нужных заявок) переменной @requests
    @requests = @search.requests
    render 'requests/index'
  end

private

  def search_params
    params.require(:search).permit(:keywords, :sla, :deadline, :request_id, :responsible, :division)
  end
end
