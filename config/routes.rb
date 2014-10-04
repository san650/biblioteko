Rails.application.routes.draw do
  post "books" => "slack#integration"
end
