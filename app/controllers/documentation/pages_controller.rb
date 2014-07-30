module Documentation
  class PagesController < Documentation::ApplicationController

    before_filter :find_page, :only => [:show, :edit, :new, :destroy, :positioning]
    
    def show
      authorizer.check! :view_page, @page
    end
    
    def edit
      authorizer.check! :edit_page, @page
      
      if request.patch?
        if @page.update_attributes(safe_params)
          redirect_to page_path(@page.full_permalink), :notice => "Page has been saved successfully."
          return
        end
      end
      render :action => "form"
    end

    def new
      authorizer.check! :add_page, @page
      
      parent = @page
      @page = Page.new(:title => "Untitled Page")
      if @page.parent = parent
        @page.parents = parent.breadcrumb
      end

      if request.post?
        @page.attributes = safe_params
        if @page.save
          redirect_to page_path(@page.full_permalink), :notice => "Page created successfully"
          return
        end
      end
      render :action => "form"
    end

    def destroy
      authorizer.check! :delete_page, @page
      @page.destroy
      redirect_to @page.parent ? page_path(@page.parent.full_permalink) : root_path, :notice => "Page has been removed successfully."
    end

    def screenshot
      authorizer.check! :upload, @page
      if request.post?
        @screenshot = Screenshot.new(screenshot_params)
        if @screenshot.save
          render :json => { :id => @screenshot.id, :title => @screenshot.alt_text, :path => @screenshot.upload.path }, :status => :created
        else
          render :json => { :errors => @screenshot.errors }, :status => :unprocessible_entity
        end
      else
        @screenshot = Screenshot.new
        render 'screenshot', :layout => false
      end
    end

    def positioning
      authorizer.check! :reposition_page, @page
      @pages = @page ? @page.children : Page.roots
      if request.post?
        Page.reorder(@page, params[:order])
        render :json => {:status => 'ok'}
      end
    end
    
    def search
      authorizer.check! :search
      @result = Documentation::Page.search(params[:query], :page => params[:page].blank? ? 1 : params[:page].to_i)
    end

    private

    def find_page
      if params[:path]
        @page = Page.find_from_path(params[:path])
      end
    end

    def safe_params
      params.require(:page).permit(:title, :permalink, :content, :favourite)
    end

    def screenshot_params
      params.require(:screenshot).permit(:upload_file, :alt_text)
    end

  end
end
