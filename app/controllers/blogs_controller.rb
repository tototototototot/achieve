class BlogsController < ApplicationController
    before_action :authenticate_user!
    before_action :set_blog, only: [:show, :edit, :update, :destroy]
  def index
		@blogs=Blog.all
  end

  # showアククションを定義します。入力フォームと一覧を表示するためインスタンスを2つ生成します。
  def show
    @comment = @blog.comments.build
    @comments = @blog.comments

		#dive19-2 通知をクリックすると、通知が既読になるようにします。
		Notification.find(params[:notification_id]).update(read: true) if params[:notification_id]
  end


  def new
    if params[:back]
      @blog = Blog.new(blogs_params)
    else
      @blog = Blog.new
    end
  end

  def create
    @blog = Blog.new(blogs_params)
    @blog.user_id = current_user.id
    if @blog.save

			redirect_to blogs_path, notice: "ブログを作成しました！"
			NoticeMailer.sendmail_blog(@blog).deliver

      ### 一覧画面へ遷移して"ブログを作成しました！"とメッセージを表示します。
      ##redirect_to blogs_path, notice: "ブログを作成しました！"
    else
      # 入力フォームを再描画します。
      render 'new'
    end
  end
  
  def edit
  # @blog = Blog.find(params[:id])
  end

  def update
  #  @blog = Blog.find(params[:id])
    @blog.update(blogs_params)  
    if @blog.save
	    redirect_to blogs_path,notice: "ブログを編集しました!"
    else
	    # 入力フォームを再描画します。
      render 'edit'
    end
  end

  def destroy
  # @blog = Blog.find(params[:id])
  @blog.destroy  
	redirect_to blogs_path,notice: "ブログを削除しました!"
  end

  def confirm
    @blog = Blog.new(blogs_params)
    render :new if @blog.invalid?
  end

  private
    def blogs_params
      params.require(:blog).permit(:title, :content)
    end

    # idをキーとして値を取得するメソッド
    def set_blog
      @blog = Blog.find(params[:id])
    end
end
