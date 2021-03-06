class PostsController < ApplicationController
  before_action :set_post, only: [:show, :edit, :update, :destroy]

  # GET /posts
  # GET /posts.json
  def index
    #user = User.create(id: 1, first_name: 'Kaiti', last_name: 'Thoma', created_at: Date.today, updated_at: Date.today)
    #Post.create(id: 1, title: 'super post', body: 'super body', created_at: Date.today, updated_at: Date.today, user_id: user.id)
    @posts = Post.all
  end

  # GET /posts/1
  # GET /posts/1.json
  def show
    #user = User.create(id: 1, first_name: 'Kaiti', last_name: 'Thoma', created_at: Date.today, updated_at: Date.today)
    #Post.create(id: 1, title: 'super post', body: 'super body', created_at: Date.today, updated_at: Date.today, user_id: user.id)
    #Post.first
  end

  # GET /posts/new
  def new
    @post = Post.new
  end

  # GET /posts/1/edit
  def edit
  end

  # POST /posts
  # POST /posts.json
  def create
    #user = User.create(id: 1, first_name: 'Kaiti', last_name: 'Thoma', created_at: Date.today, updated_at: Date.today)
    @post = Post.new()#(id: 1, title: 'super post', body: 'super body', created_at: Date.today, updated_at: Date.today, user_id: user.id)

    respond_to do |format|
      if @post.save
        format.html { redirect_to @post, notice: 'Post was successfully created.' }
        format.json { render :show, status: :created, location: @post }
      else
        format.html { render :new }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /posts/1
  # PATCH/PUT /posts/1.json
  def update
    respond_to do |format|
      if @post.update(post_params)
        format.html { redirect_to @post, notice: 'Post was successfully updated.' }
        format.json { render :show, status: :ok, location: @post }
      else
        format.html { render :edit }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /posts/1
  # DELETE /posts/1.json
  def destroy
    @post.destroy
    respond_to do |format|
      format.html { redirect_to posts_url, notice: 'Post was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_post
      @post = Post.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def post_params
      params.require(:post).permit(:title, :body)
    end
end
