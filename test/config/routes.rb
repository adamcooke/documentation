Rails.application.routes.draw do
  mount Documentation::Engine => "/docs"
end
