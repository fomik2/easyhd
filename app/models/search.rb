class Search < ActiveRecord::Base
  
  def requests
    @requests ||= find_requests
  end

private
  
  def find_requests
    
    # Сначала присваиваем все записи
    requests = Request.order(:id)
    
    # Начинаем отбирать из всех те записи, которые попадают под условия
    requests = requests.where("comment LIKE ?", '%'+keywords+'%') if keywords.present?
    requests = requests.where(id: request_id) if request_id.present?
    requests = requests.where("deadline > ?", deadline) if deadline.present?
    requests = requests.where(sla_number: sla) if sla.present?
    requests = requests.where(responsible: responsible) if responsible.present?
    requests = requests.where(division: division) if division.present?
    return requests
  end

end
