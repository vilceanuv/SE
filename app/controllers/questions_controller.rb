class QuestionsController < ApplicationController
  before_action :set_question, only: [:show, :edit, :update, :destroy]

  # GET /questions
  # GET /questions.json
  def index
    @questions = Question.all
    session[:celebrities] = Celebrity.all.pluck(:id)
  end

  # GET /questions/1
  # GET /questions/1.json
  def show
  end

  def next_question
    q = Question.find(params[:id].to_i + 1)
    res = {}

    ids = []
    puts "params id => #{params[:id]}"
    puts "params value => #{params[:value]}"
    celebrities = if(params[:id].to_i >= 4 && params[:id].to_i <= 10)
                    ActiveRecord::Base.connection.execute(questions_attributes[params[:id].to_i])
                  else
                    ActiveRecord::Base.connection.execute(questions_attributes[params[:id].to_i] + params[:value].to_s)
                  end
    celebrities.each do |c|
      ids << c.first
    end
    puts "ids => #{ids}" 
    puts "session celebrities => #{session[:celebrities]}"
    if params[:id].to_i >= 4 && params[:id].to_i <= 10
      if params[:value] == '1'
        session[:celebrities] = session[:celebrities] & ids
      else
        session[:celebrities] = session[:celebrities] - ids
      end
    else
      session[:celebrities] = session[:celebrities] & ids
    end

    puts "celebrities after => #{session[:celebrities]}"
    if session[:celebrities].size == 1
      res['name'] = Celebrity.find(session[:celebrities].first).name
    end

    res['id'] = q.id
    res['qst'] = q.qst

    respond_to do |format|
      format.json { render json: res}
    end
  end

  # GET /questions/new
  def new
    @question = Question.new
  end

  # GET /questions/1/edit
  def edit
  end

  def questions_attributes
    {1 => 'SELECT * FROM celebrities where male = ', 
     2 => 'SELECT * FROM celebrities where real_person = ',
     3 => 'SELECT * FROM celebrities where dead = ',
     4 => "SELECT * FROM celebrities where domain = 'singer'",
     5 => "SELECT * FROM celebrities where domain = 'political figure'",
     6 => "SELECT * FROM celebrities where domain = 'sportsman'",
     7 => "SELECT * FROM celebrities where domain = 'actor'",
     8 => "SELECT * FROM celebrities where nationality = 'American'",
     9 => "SELECT * FROM celebrities where nationality = 'Romanian'",
     10 => "SELECT * FROM celebrities where skin_color = 'black'",
     11 => "SELECT * FROM celebrities where age > 35"
    }
  end

  # POST /questions
  # POST /questions.json
  def create
    @question = Question.new(question_params)

    respond_to do |format|
      if @question.save
        format.html { redirect_to @question, notice: 'Question was successfully created.' }
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
    respond_to do |format|
      if @question.update(question_params)
        format.html { redirect_to @question, notice: 'Question was successfully updated.' }
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
      format.html { redirect_to questions_url, notice: 'Question was successfully destroyed.' }
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
      params.require(:question).permit(:qst, :execute_if_real)
    end
end
