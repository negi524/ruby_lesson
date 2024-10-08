class CommentsController < ApplicationController
  def create
    # 先に記事のオブジェクトを取得する
    @article = Article.find(params[:article_id])
    # コメントの作成と保存を同時に行っている
    # コメントと記事が自動的にリンクされ、指定された記事に対してコメントが従属するようになる
    @comment = @article.comments.create(comment_params)
    # 元の記事の画面に戻る
    redirect_to article_path(@article)
  end

  def destroy
    @article = Article.find(params[:article_id])
    @comment = @article.comments.find(params[:id])
    @comment.destroy
    redirect_to article_path(@article), status: :see_other
  end

  private
  def comment_params
    params.require(:comment).permit(:commenter, :body, :status)
  end
end
