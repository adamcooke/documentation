module Documentation
  class PagesController < ApplicationController

    before_filter :find_page, :only => [:show, :edit, :new, :destroy, :positioning]
    
    def edit
      if request.patch?
        if @page.update_attributes(safe_params)
          redirect_to page_path(@page.full_permalink), :notice => "Page has been saved successfully."
          return
        end
      end
      render :action => "form"
    end

    def new
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
      @page.destroy
      redirect_to @page.parent ? page_path(@page.parent.full_permalink) : root_path, :notice => "Page has been removed successfully."
    end

    def positioning
      if request.post?
        Page.reorder(@page, params[:order])
        render :json => {:status => 'ok'}
      end
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

  end
end
