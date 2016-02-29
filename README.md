# cookLah
An IS1112 project that brings fresh ingredients to your door step

Hey developers, you may want to know where to find the following:
* Navigation bar -> app/views/layouts/application.html.erb
([this](http://twitterbootstrap3navbars.w3masters.nl/?color=%23ff8819&linkcolor=%23ffffff&activelinkcolor=%23c0c0c0&gradient=0&gradient=1&borders=0&borders=1) seems like a good starting point to style the navbar)
* homepage -> views/homepage/index.html.erb
* css files -> assets/stylesheets folder
* ... ask in the group :P

# TODO
* implement user interface - xiya
* style home page - Jack
* fill up info on ingredients/equipment/recipes - Ziying
* overall in-charge of functionalities, aesthetics and user experience -Jingjing

# Tips

* Bootstrap http://getbootstrap.com/

* To create new webpages, you need to generate controllers. Inside the /bin folder, type in `rails generate controller <controller_name> <action> <action> <action>`.  You can have an arbitrary number of actions (so instead of 3 can just have 1). Replace <controller_name> with the name of the webpage (or a set of webpages) you want to generate. Replace action with the actual name or function of the webpage. For example, `rails generate homepage index` will generate the index.html.erb file inside the homepage folder in the views folder. (why is it called controller and action?)

* Google

* Create a pull request to my github repository for every change you make (styled a page/create and generate the template for a new page). Watch this video https://www.youtube.com/watch?v=SCZF6I-Rc4I to understand the basics of github collaboration. (After you sent the pull request, I will receive it and decide how to merge with the main repository. So don't send a pull request after you've edited a whole chunk. Clearly label every change you make for ease of code merging)

* http://cooklah.herokuapp.com/ is the address of our website. Manage inventory at https://cooklah.herokuapp.com/inventory_management/ with the user name: `admin@CookLah` and the password: `IS1112ROCKS`.