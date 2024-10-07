class ArticlesController < ApplicationController
  def index
    @articles = Article.all
  end

  def show
    @article = Article.find(params[:id])
  end

  def new
    @article = Article.new
  end

  def create
    @article = Article.new(article_params)

    if @article.save
      redirect_to @article
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    # DBから記事を取得して、@articleに保存し、フォームを作成するときに使えるようにする
    @article = Article.find(params[:id])
  end

  def update
    # DBから記事を取得
    @article = Article.find(prams[:id])

    # article_paramsでフィルタリングされた送信済みのデータで更新を試みる
    if @article.update(article_params)
      # 成功した場合は、記事ページに移動する
      redirect_to @article
    else
      # 失敗した場合はeditをレンダリング
      render :edit, status: :unprocessable_entity
    end
  end

  private
    def article_params
      params.require(:article).permit(:title, :body)
    end
end
