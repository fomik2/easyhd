class RequestsController < ApplicationController
  
  skip_before_action :authenticate_user!, only: [:is_user_login]
  before_action :find_request, except: [:is_user_login, :create, :index, :new ]

  def is_user_login
    if user_signed_in?
      redirect_to requests_path
    else
      render 'is_user_login'
    end
  end

  def edit
  
  end
  
  def show
       
  end
  
  def update
    if @request.update(request_params)
      redirect_to requests_path
    else
      render 'edit'
    end
  end

  def new
    @request = Request.new
  end

  def create
    @request = Request.new(request_params)
    if @request.save
      redirect_to requests_path(current_user)
    else
     render 'new'
    end
  end

  def index
    if params[:my_requests]
      @requests = current_user.requests.all
    else
      @requests = Request.find_requests(params[:search])
    end
  end

  def destroy
    @request.destroy
    redirect_to requests_path
  end

private
  
  def request_params
    params.require(:request).permit(:initiator, 
                                    :responsible, 
                                    :comment, 
                                    :sla_number, 
                                    :time_for_deadline, 
                                    :department_id, 
                                    :user_id, 
                                    :division, 
                                    :status, 
                                    :sla_id)
  end
  
  def find_request
    @request = Request.find(params[:id])
  end

end
