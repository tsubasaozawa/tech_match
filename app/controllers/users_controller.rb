class UsersController < ApplicationController
  before_action :set_users, only: [:index, :follower_list, :following_list]
  before_action :set_user, only: [:show, :destroy, :edit, :update, :withdrawal]
  def index
    @users = User.where.not(id: current_user.id)
  end

  def follower_list
  end
  def following_list
  end
  def matching_list
    @matched_users = current_user.matchers
  end

  def show
    @relationship = Relationship.new
  end

  def destroy
    if @user.destroy
      redirect_to root_path
    else
      render :show, notice: '削除できませんでした'
    end
  end

  def withdrawal
  
  end

  def edit
    render "users/#{params[:name]}", locals: {user: current_user }
  end

  def update
    if current_user.update(user_params)
      redirect_back(fallback_location: root_path)
    else
      render :show
    end
  end

  def admin_member
    @users = User.where.not(id: current_user.id)
  end

  private

  def set_users
    @users = User.where.not(id: current_user.id)
  end

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:email, :nickname, :lastname_kanji, :firstname_kanji, :lastname_kana, :firstname_kana, :profile_text, :profile_image)
  end
end
