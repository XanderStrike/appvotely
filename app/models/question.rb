class Question < ActiveRecord::Base
  serialize :options
  belongs_to :survey
end
