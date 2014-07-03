# Rotten Mangoes

This is the example repo for Lighthouse Labs' second Rails app: Rotten Mangoes, inspired by Rotten Tomatoes.

Routes file:
resources :movies do
  resources :reviews, only: [:new, :create]
end
resources :users, only: [:new, :create, :edit, :update] #edit is like get/new, update is like post/create.
resources :sessions, only: [:new, :create, :destroy]
root to: 'movies#index'

Pairs: get/post, new/create, edit/update

Flow for user profile update:
1. User GET a form
  *GET request for an :edit page
2. User is going to POST the form
  *PUT/PATCH request to.....
3. User is redirected to another page
4. Browser makes another request (clears the DOM) to the redirected location
5. 

If user try to go to GET /users/8/edit url
- need to look in the session[:user_id] to see if current user id match 8.
- if not then redirect.
- But this is complicated. You should do away with ID. Just need to go to /profile/edit (since you already know who the user is)

Using GET /profile/edit
route: resource :profile, only: [:edit, :update] #its singular, it doesn't create index route, also don't need :id.
- @user = current_user
command: rake routes | grep profile

<%= form_for @user, url: profile_path do |f| %>
<% end %>


note:
helper_method (make method accessible to view files)  

