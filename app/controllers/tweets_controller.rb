class TweetsController < ApplicationController
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

  private

  def tweet_params
    params.require(:tweet).permit(:title, :description, :video_url, :image).merge(user_id: current_user.id)
  end

  def set_tweet
    @tweet = Tweet.find(params[:id])
  end
end
