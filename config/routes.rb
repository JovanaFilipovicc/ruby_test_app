Rails.application.routes.draw do
  # DEFINISEMO RUTU, I TO CE BITI KONTROLER KOJI SE NALAZI U FOLDERU "CONTROLLERS". U ovom slucaju to je application_controller

  root 'pages#home' #nema potrebe za dodatkom _controller, jer se u Rubiju podrazumeva da je to kontroler
  get 'about', to: 'pages#about'
  resources :articles
end
