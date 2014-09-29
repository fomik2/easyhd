desc "Remove searches older than a day"
task remove_old_searches: :enviroment do 
  Search.delete_all ["created_at < ?", 1.day.ago]
end