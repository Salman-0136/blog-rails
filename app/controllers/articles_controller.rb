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
      redirect_to @article, notice: "Article created successfully!"
    else
      render :new
    end
  end


  def edit
    @article = Article.find(params[:id])
  end

  def update
    @article = Article.find(params[:id])
    if @article.update(article_params)
      redirect_to @article, notice: "Article was successfully updated."
    else
      render :edit
    end
  end

  def destroy
    @article = Article.find(params[:id])
    @article.destroy
    redirect_to all_articles_path, notice: "Article was successfully deleted."
  end

  def publish
    @article = Article.find(params[:id])
    if @article.status == "published"
      redirect_to @article, notice: "Article is already published."
      return
    end

    begin
      @article.publish!
      redirect_to @article, notice: "Article was published."
    rescue => e
      redirect_to @article, alert: "Could not publish article: #{e.message}"
    end
  end

  private

  def article_params
    params.require(:article).permit(:title, :description, :status, :published_at, :cover_image)
  end
end
