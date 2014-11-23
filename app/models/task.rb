class Task < ActiveRecord::Base
belongs_to :project

scope :backlog,     -> { where(status: "Backlog") }
scope :in_progress, -> { where(status: "In Progress") }
scope :completed,   -> { where(status: "Completed") }

end
