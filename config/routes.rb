Embed::Application.routes.draw do
  get '/' => 'pages#home'
  get '*repo' => 'issues#show'
end
