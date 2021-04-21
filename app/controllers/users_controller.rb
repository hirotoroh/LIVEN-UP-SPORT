class UsersController < ApplicationController
  @user = User.find(params[:id])
  @nickname = @user.nickname
  @tweet = @user.tweet
end
