class TweetsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :destroy, :edit]
  before_action :move_to_index, except: [ :index, :show, :create, :new, :edit ]
  before_action :set_tweet, only: [:show, :edit]

  def index
    @tweets = Tweet.all
  end

  def new
    @tweet = Tweet.new
  end

  def create
    @tweet = Tweet.new(tweet_params)
    if @tweet.save
      redirect_to root_path
    else 
      render :new
    end
  end

  def show
    @comment = Comment.new
    @comments = @tweet.comments.includes(:user)
  end

  def edit
    unless @tweet.user_id == current_user.id
      redirect_to action: :index
    end
  end

  def update
    @tweet = Tweet.find(params[:id])
    @tweet.update(tweet_params)
    if @tweet.save
      redirect_to tweet_path
    else
      render :edit
    end
  end

  def destroy
    tweet = Tweet.find(params[:id])
    tweet.destroy
    redirect_to root_path
  end

  private

  def tweet_params
    params.require(:tweet).permit(:title, :description, :video_url, :image).merge(user_id: current_user.id)
  end

  def move_to_index
    unless  user_signed_in?
      redirect_to action: :index
    end
  end

  def set_tweet
    @tweet = Tweet.find(params[:id])
  end
end
