# frozen_string_literal: true
# == Schema Information
#
# Table name: answers
#
#  id          :integer          not null, primary key
#  question_id :string
#  selection   :string
#

class Answer < ActiveRecord::Base
  belongs_to :question
  serialize :selection
end
