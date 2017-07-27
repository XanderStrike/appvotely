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

class QuestionsController < ApplicationController
  before_action :set_question, only: [:show, :edit, :update, :destroy]

  # GET /questions/new
  def new
    @question = Question.new(survey_id: params[:survey_id])
  end

  # GET /questions/1/edit
  def edit
  end

  # POST /questions
  # POST /questions.json
  def create
    rams = question_params
    rams[:options] = rams[:options].split(',').map(&:strip)
    @question = Question.new(rams)

    respond_to do |format|
      if @question.save
        format.html { redirect_to @question.survey, notice: 'Question was successfully created.' }
        format.json { render :show, status: :created, location: @question }
      else
        format.html { render :new }
        format.json { render json: @question.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /questions/1
  # PATCH/PUT /questions/1.json
  def update
    rams = question_params
    rams[:options] = rams[:options].split(',').map(&:strip)

    respond_to do |format|
      if @question.update(rams)
        format.html { redirect_to @question.survey, notice: 'Question was successfully updated.' }
        format.json { render :show, status: :ok, location: @question }
      else
        format.html { render :edit }
        format.json { render json: @question.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /questions/1
  # DELETE /questions/1.json
  def destroy
    @question.destroy
    respond_to do |format|
      format.html { redirect_to @question.survey, notice: 'Question was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_question
      @question = Question.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def question_params
      params.require(:question).permit(:name, :options, :survey_id)
    end
end
