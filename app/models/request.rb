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
    deadline <= DateTime.now && self.status == "В работе"
  end
  
  def set_deadline_if_it_after_or_before_work_day
    cur_year = DateTime.now.year
    cur_month = DateTime.now.month
    cur_day = DateTime.now.day
    start_work_day = DateTime.civil_from_format :local, cur_year, cur_month, cur_day, 9, 0, 0
    end_work_day = DateTime.civil_from_format :local, cur_year, cur_month, cur_day, 18, 0, 0
    if self.deadline.hour < 9
      self.deadline = DateTime.civil_from_format :local, deadline.year, deadline.month, deadline.day, 9,0,0
    elsif self.deadline.hour > 18
      new_day = deadline.day + 1.day
      self.deadline = DateTime.civil_from_format :local, deadline.year, deadline.month, new_day, 9,0,0 
    end

  end
  
  def set_deadline
    @sla_weight = Sla.find(self.sla_id).time_for_deadline
    self.deadline = DateTime.now.advance(hours: @sla_weight)
    set_deadline_if_it_after_or_before_work_day
  end

end
