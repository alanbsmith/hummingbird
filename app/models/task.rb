class Task < ActiveRecord::Base
belongs_to :project

scope :backlog,     -> { where(status: "1") }
scope :in_progress, -> { where(status: "2") }
scope :completed,   -> { where(status: "3") }

end
