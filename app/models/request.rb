class Request < ActiveRecord::Base
  belongs_to :user
  belongs_to :department
  belongs_to :sla
  
  validates :initiator,
            :comment, 
            :department_id, 
            :user_id, 
            :status, 
            :sla_id, presence: true

  before_create :set_deadline
  
  def self.find_requests(search)
    if search
      Request.where("comment LIKE ?", '%'+search+'%')
    else
      Request.all
    end
  end

  def check_deadline_status
    deadline <= Time.now && self.status == "В работе"
  end
  
  def set_deadline
    time_for_deadline = Sla.find(self.sla_id).time_for_deadline
    self.deadline = DateTime.now + time_for_deadline.hours
    byebug
    return self.deadline
  end

end
