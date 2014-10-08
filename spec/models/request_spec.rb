require 'rails_helper'

 describe Request do

   before :each do
     @sla = Sla.create!({ id: 1, sla_value: 1,  time_for_deadline: 12 })
     @department = Department.create!({ id: 1, name: "Отдел тестовый", number_of_employees: 12 }) 
     @request = Request.create!({ initiator: "Иван Петров",
                              responsible: "Петр Иванов",
                              comment: "Комментарий",
                              status: "Новая",
                              department_id: 1,
                              sla_id: 1,
                              user_id: 1 })
   end
   
  
   it "check deadline setter" do
     expect(@request.deadline).to be > DateTime.now
   end

end