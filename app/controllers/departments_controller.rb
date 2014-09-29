class DepartmentsController < ApplicationController
  
  def new
    @department = Department.new
  end

  def create
    @department = Department.new(department_params)
    if @department.save
      flash[:notice] = "Отдел добавлен"
      redirect_to settings_path
    else
      flash[:error] = "Ошибка"
    end 
  end


private

  def department_params
    params.require(:department).permit(:name, :number_of_employees)
  end

end