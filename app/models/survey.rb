# frozen_string_literal: true
class Survey < ActiveRecord::Base
  has_many :questions
end
