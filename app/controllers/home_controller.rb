class HomeController < ApplicationController
  def index
    @survey = Survey.first
  end

  def answer
    params[:answer].keys.each do |x|
      Answer.new(question_id: x, selection: params[:answer][x][:answer]).save!
    end

    render text: 'thanks'
  end
end
