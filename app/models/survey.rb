# frozen_string_literal: true
# == Schema Information
#
# Table name: surveys
#
#  id         :integer          not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  default    :boolean
#

class Survey < ActiveRecord::Base
  has_many :questions

  validate :only_one_default

  def self.default
    Survey.where(default: true).first
  end

  def only_one_default
    if default && Survey.where(default: true).count > 0
      errors.add(:default, "There can only be one!")
    end
  end
end
