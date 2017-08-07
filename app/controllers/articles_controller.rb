class ArticlesController < ApplicationController
    
    #Authentication
    http_basic_authenticate_with name: "me", password: "meh", except: [:index, :show]
    
    #INDEX feature
    def index
        @articles = Article.all
    end
    
    #SHOW feature
    def show
        @article = Article.find(params[:id])
    end
    
    #NEW feature
    def new
        @article = Article.new
    end
    
    #EDIT feature
    def edit
        @article = Article.find(params[:id])
    end
    
    #CREATE feature
    def create
        @article = Article.new(article_params)
 
        if @article.save
            redirect_to @article
        else
            render 'new'
        end
    end
    
    #UPDATE feature
    def update
        @article = Article.find(params[:id])
 
        if @article.update(article_params)
            redirect_to @article
        else
        render 'edit'
        end
    end
 
    #DESTROY feature
    def destroy
        @article = Article.find(params[:id])
        @article.destroy
 
        redirect_to articles_path
    end

 
    #PRIVATE items
    private
    
    def article_params
        params.require(:article).permit(:title, :text)
    end
    
end
