# Specifications for the Sinatra Assessment

Specs:
- [x] Use Sinatra to build the app
      This project is based on Sinatra frame work by using the routing configuration of Sinatra 
- [x] Use ActiveRecord for storing information in a database
      This project has alot to do with association which a user can create a deal and associate it with a category. A user can look for a deal by select a specific category which associated to its deals. A user can search a deal from all of deals. All the above options are available to the current user but, other user would not be able to see the deals that not belong to them.
- [x] Include more than one model class (list of model class names e.g. User, Post, Category)
      User, Deal, Category
- [x] Include at least one has_many relationship (x has_many y e.g. User has_many Posts)
      A user has_many deals, a deal has_many users
- [x] Include user accounts
      The application would not work without a user signed up or logged in, whichrequire user account to manage such feature.
- [x] Ensure that users can't modify content created by other users
      The application would not let other user modify deals that not belongs to them same for categories, all the modification functions are secure by checking if the content is belongs to the current user.
- [x] Include user input validations
      When the user create a deal the validates_presence_of secure the input in two situations one, is upon creation and second is upon update. 
      the same is applay for creating category.
- [x] Display validation failures to user with error message (example form URL e.g. /posts/new)
      The flash[:messages] is being used at the appropriate places.
- [x] Your README.md includes a short description, install instructions, a contributors guide and a link to the license for your code

Confirm
- [x] You have a large number of small Git commits
- [x] Your commit messages are meaningful
- [x] You made the changes in a commit that relate to the commit message
- [x] You don't include changes in a commit that aren't related to the commit message
      Sometimes there are some irelavint inforamtion, at the beginig i used git add . without relize that other information is commited to.
