class ArticlesController < ApplicationController

 def index
  owner = Owner.find(params[:owner_name])
   @articles = owner.articles
    respond_to do |format|
     format.html 
     format.json { render json: @articles}
    end
  end
  def show
    @article = Article.find(params[:id])
     render json: @article
   end
  def new
  
   @article = Article.new
  end
  def create
   @owner = params[:owner_id]
   @article = Article.new(article_params)
      respond_to do |format|
       if @article.save
        format.html {redirect_to root_path}
        format.json { render json: @article}
       else
        format.html {render "new"}
        format.json {render errors: @article.errors.full_messages }
       end
      end
  end
  
  private
   def article_params
    params.require(:article).permit(:owner_name,:name,:price,:description)
   end
end
