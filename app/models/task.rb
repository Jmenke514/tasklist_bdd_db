class Task < ActiveRecord::Base
  # def make_new_task (title,description)
  #   task.title = title
  #   task.description = description
  #   task.save
  # end
  def set_done
    self.done = true
    self.save
  end
  def update_title(string, id)
    self.title = string
    self.save
  end
end
