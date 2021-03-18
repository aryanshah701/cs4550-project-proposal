#Project Proposal Document


## Who is on your team?

  Our team members are Eli Frank, Nicholas Bagley, Frank Pizzella,
and Aryan Shah.


## What is your project idea?

  Our project idea is an app called *Go Study*.  This is an app
that will allow its users to find an ideal location around their
area to go do homework or study. People often go to a local coffee
shop to study on a weekend, only to find that it is far too noisy
to get any work done once they get there. Or maybe they cannot even
find a seat because the café is so full. This is the issue our app
is trying to solve.
  Users will be able to login and see all of the nearby
study spots that have already been registered in the app. Information
about the spot will be available for the user to make the best
decision on where they want to go. Users will be able to add comments
and ratings on already existing spots to help future users make a
better decision. In addition to viewing existing study spots, users
will be able to add new locations they find to the app. Once a new
study spot is added it will be available for all other users to view
and rate in the future. Users can also upload photos of the spots to
the app. This can be when creating a new spot, or when adding a
comment to an existing one. The goal of this app is to create a
community that helps each other find the best place to study based
on what an individual user wants, whether that is complete silence,
good coffee, or early hours.


## What API do you plan to use?

  We are planning on using the Google Places API. This API allows us
to get information we need about possible study locations. By using
HTTP requests the API can get a list of places based on a location
search. It also allows us to get photos of these places which will be
helpful to add to the app before there are any photos uploaded by
users. One of the most important features of the API is access to the
details of a location. By using this we can get initial data on the
study locations that we want to display to users. We have to see
exactly what data is available for each place, but things such as
hours, menu, and reviews will all be helpful when first adding a new
study spot to the app that no users have rated or commented on yet.


## What realtime behavior are you planning?

  To emphasize the sense of community in the app it would be nice to
see how many users are currently at a specific location studying.
It will also help a user to see which places are currently busy if
they are can see how many other users are at a given location. To do
this we will need to have real-time behavior. When a user is logged
in to the app there will be a feature available that checks where
they are studying. If they are studying at a spot that is available
on the app, then a live counter will update relating to that specific
spot that displays how many users are currently studying there. This
counter will then go down if the user logs out or leaves the study
spot. This way it is easy to check if there are too many people there
already, or on the contrary if you are looking for other users to
study with.
  There are definitely occasions where a user wants a spot that has
other users there already so they can study and chat together. To
make the app better for these situations it might be helpful to add
a user's username to a list of users currently studying in a specific
spot. This can be done real-time along with the count that is updated
for a location. That way a user can see if anybody they know is at a
study spot they want to go to. The user's name will be taken off the
list when they log out or leave, just like the count will go down.


## What persistent state other than users will you be storing in a
## postgres DB?

  The main focus of the app is to hold information on possible study
spots in the user's area. That means we will have a table that
holds location data. This data could include things such as latitude,
longitude, whether it has indoor seating, WiFi availability, hours,
menu, noise level, and average rating. This data will both be input
and updated by users, and also taken from the Google Places API.
  In addition to the location information we want users to be able
to leave comments about the study spot. This means we will need a
postgres table to store these comments, similarly to how it works in
the Events App homework. We will have to experiment with location
ratings to figure out if they are best stored on the location itself
or in their own state. Access restrictions will also be present to
limit users in updating and deleting records that they should not.
This includes deleting other users, other user's comments, and
existing locations.


## What "something neat" thing are you going to do?

  We are planning on using the HTML Geolocation API to identify a
user's location. This feature will require a user's approval since
it would be a breach of privacy otherwise. If a user approves of it
then the app will default to showing locations that are nearby the
current user instead of the user having to search for a specific
location. This way when the user logs in they will automatically see
study spots in their area. The location that is retrieved from the
HTML Location API can be applied to the Google Places API search to
request places in the given location. Additionally, the location
can be queried against the apps database of study spots to display
nearby places.
  Allowing the app to know the user's location also makes it easier
to see which users are in certain study spots. This way the real-
time counter and user list that is present for each location can be
updated automatically when a user enters and exits a study spot
instead of requiring any manual input from the user. The list of
locations that the user sees on their home page would also update
dynamically if the user traveled to a new location, such as moving
to a new city. 
