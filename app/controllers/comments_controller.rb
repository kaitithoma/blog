class CommentsController < ApplicationController
  before_action :set_comment, only: [:show, :edit, :update, :destroy]

  # GET /comments
  # GET /comments.json
  def index
    #user = User.create(id: 1, first_name: 'Kaiti', last_name: 'Thoma', created_at: Date.today, updated_at: Date.today)
    post = Post.create(id: 1, title: 'super post', body: 'super body', created_at: Date.today, updated_at: Date.today, user_id: user.id)
    Comment.create(id: 1, post_id: post.id, body: 'comment body', created_at: Date.today, updated_at: Date.today, user_id: user.id)
    @comments = Comment.all
  end

  # GET /comments/1
  # GET /comments/1.json
  def show
  end

  # GET /comments/new
  def new
    @comment = Comment.new
  end

  # GET /comments/1/edit
  def edit
  end

  # POST /comments
  # POST /comments.json
  def create
    #user = User.create(id: 1, first_name: 'Kaiti', last_name: 'Thoma', created_at: Date.today, updated_at: Date.today)
    #post = Post.create(id: 1, title: 'super post', body: 'super body', created_at: Date.today, updated_at: Date.today, user_id: user.id)
    #@comment = Comment.new(id: 1, post_id: post.id, body: 'comment body', created_at: Date.today, updated_at: Date.today, user_id: 1)

    respond_to do |format|
      if @comment.save
        format.html { redirect_to @comment, notice: 'Comment was successfully created.' }
        format.json { render :show, status: :created, location: @comment }
        format.js
      else
        format.html { render :new }
        format.json { render json: @comment.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /comments/1
  # PATCH/PUT /comments/1.json
  def update
    respond_to do |format|
      if @comment.update(comment_params)
        format.html { redirect_to @comment, notice: 'Comment was successfully updated.' }
        format.json { render :show, status: :ok, location: @comment }
      else
        format.html { render :edit }
        format.json { render json: @comment.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /comments/1
  # DELETE /comments/1.json
  def destroy
    @comment.destroy
    respond_to do |format|
      format.html { redirect_to comments_url, notice: 'Comment was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_comment
      @comment = Comment.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def comment_params
      params.require(:comment).permit(:post_id, :body)
    end
end
