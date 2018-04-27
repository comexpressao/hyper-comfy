Rails.application.routes.draw do
  root 'hyperloop#helloworld'

  comfy_route :cms_admin, path: '/admin'
  # Ensure that this route is defined last
  # comfy_route :cms, path: '/', sitemap: false
  mount Hyperloop::Engine => '/hyperloop'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
