class QuestionsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_question, only: [:show, :edit, :update, :destroy, :follow]

  # GET /questions
  # GET /questions.json
  def index
    @questions = Question.all
  end

  # GET /questions/1
  # GET /questions/1.json
  def show  
  end

  # GET /questions/new
  def new
    @question = Question.new
  end

  # GET /questions/1/edit
  def edit
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

  def follow
    if params[:topic_id]
      f = Following.find_or_create_by(follower_type:"Topic",follower_type_id:params[:topic_id], user_id: current_user.id)  
      if f.new_record?
        respond_to do |format|
          format.html { redirect_to @question }
          flash[:success] = "You are now following this Topic."
        end  
      else  
        respond_to do |format|
          format.html { redirect_to @question }
          flash[:warning] = "You are already following this Topic." 
        end                
      end  
    elsif params[:user_id]  
      f = Following.find_or_create_by(follower_type:"User",follower_type_id:params[:user_id], user_id: current_user.id)
      if f.new_record?
        respond_to do |format|
          format.html { redirect_to @question }
          flash[:success] = "You are now following this User."
        end         
      else  
        respond_to do |format|
          format.html { redirect_to @question }
          flash[:success] = "You are already following this User"
        end              
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

    # Only allow a list of trusted parameters through.
    def question_params
      params.require(:question).permit(:content, :topic_id, :user_id)
    end
end
