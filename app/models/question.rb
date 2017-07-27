# frozen_string_literal: true
# == Schema Information
#
# Table name: questions
#
#  id         :integer          not null, primary key
#  name       :string
#  options    :string
#  survey_id  :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Question < ActiveRecord::Base
  serialize :options
  belongs_to :survey
  has_many :answers

  def results
    options.map do |op|
      answers.where(selection: op).count
    end
  end
end
