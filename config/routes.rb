Rails.application.routes.draw do

    root to: 'home#index'

    get '/', to: 'home#index', as: 'home'

    post '/dial', to: 'home#dial', as: 'dial'

    get '/twiml', to: 'home#index', as: 'twiml'



end
