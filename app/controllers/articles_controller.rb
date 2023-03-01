class ArticlesController < ApplicationController

    def show
        @article = Article.find(params[:id])
    end

    def index
        @articles = Article.all
    end

    def new
        @article = Article.new
    end

    def edit
        @article = Article.find(params[:id])
    end

    def create
        # render plain: params[:article] --- KAKO BI PRILIKOM KLIKA DOBILI INFORMACIJU SA PODACIMA U JSON FORMATU
        #MEDJUTIM, MI NE ZELIMO SAMO DA PRIKAZUJEMO PODATKE, VEC I DA IH CUVAMO U BAZI
        @article = Article.new(params.require(:article).permit(:title, :description))
        #render plain: @article.inspect --- AKO ZELIMO DA PRIKAZEMO NA EKRANU
        
        if @article.save #CUVAMO U BAZI
            flash[:notice] = "Article saved successfully."
            redirect_to @article
        else
            render 'new'
        end
       # redirect_to article_path(@article) #REDIREKTOVACE NA "SHOW" STRANU KAKO BI PRIKAZAO DETALJE O NOVOKREIRANOM ARTIKLU
    end

    def update
        @article = Article.find(params[:id])
        
        if @article.update(params.require(:article).permit(:title, :description)) #OVO CE IMATI ISTI EFEKAT KAO "SAVE" GORE, SAMO STO OVDE MENJAMO
            flash[:notice] = "Article was updated successfully." #OVIM SE ISPISUJE PORUKA
            redirect_to @article
        else
            render 'edit'
        end
    end

    def destroy
        @article = Article.find(params[:id])
        @article.destroy
        flash[:notice] = "Article has been deleted."
        redirect_to articles_path
    end

end