# cookLah
An IS1112 project that brings fresh ingredients to your door step

# TODO
* fix email link not received problem - xiya
* start styling home page (can add placeholder text for info from database; leave out contents that should be generated using loop or add-on, like the recipe section;) - Jack
* start filling up the database after the inventory management interface is complete - Ziying
* advise functionalities and overall user experience -Jingjing

# Tips
* most of the view file to edit should be found inside app/views folder. For example, the home page is located at /app/views/homepage/index.html.erb relative to the cookLah source folder
* refer to http://getbootstrap.com/components/ for the list of available bootstrap components and http://startbootstrap.com/ for bootstrap templates.
* Leave the linking part to me. Focus on styling the webpages first. Create a webpage if you need to using the below method
* To create new webpages, you need to generate controllers. Inside the /bin folder, type in `rails generate controller <controller_name> <action> <action> <action>`.  You can have an arbitrary number of actions (so instead of 3 can just have 1). Replace <controller_name> with the name of the webpage (or a set of webpages) you want to generate. Replace action with the actual name or function of the webpage. For example, `rails generate homepage index` will generate the index.html.erb file inside the homepage folder in the views folder. (why is it called controller and action?)
* When in doubt, Google is your best friend.
* Create a pull request to my github repository for every change you make (styled a page/create and generate the template for a new page). Watch this video https://www.youtube.com/watch?v=SCZF6I-Rc4I to understand the basics of github collaboration. (After you sent the pull request, I will receive it and decide how to merge with the main repository. So don't send a pull request after you've edited a whole chunk. Clearly label every change you make for ease of code merging)
* https://www.codecademy.com/ this is the website that I thought was quite good. Sign up and go to the course Make a Website. You should see a message at the top of the page that says `This is the new Make a Website. Click Here to view the old version (available until 02/28/16).` Use the old version because I think a lot of stuff is locked up in the new version.
* http://cooklah.herokuapp.com/ is the address of our website. Please add ingredients/recipes/equipment to this website after inventory management interface is finished.