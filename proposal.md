# Project Proposal Document

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


## What persistent state other than users will you be storing in a postgres DB?

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

## Experiment 1

This experiment focused on the HTML Geolocation API as well as the
Google Maps API. Overall, the Geolocation API was relatively easy
to use. We were able to access a user�s location information such
as their latitude, longitude, and the time stamp of when this
location was recorded. Additionally, the API gives us access to
additional information such as the accuracy of the position, the
altitude, which direction they are heading in, and at what speed
they are heading. Of these remaining fields, the most useful ones
will likely be the direction someone is heading and the accuracy of
the position. We could potentially use someone�s heading to figure
out study spots in that direction. Something interesting to note
about the position is that it seems to be less accurate when using
wifi as opposed to cellular data, but this is probably okay since we
assume that most people using this site will be on their phones. On
the other hand, the Google Maps API was a good bit more difficult to
get the hang of. Google�s Maps API required an account and API key.
There seems to be some limit on how frequently we can use Google�s
Maps API for free, but for our purposes and volume, we think we will
be fine. The primary issue with getting this API functioning is that
we were unable to access it directly, so we needed to use a library.
Of the libraries we tried so far, one called google-map-react seemed
to work relatively well. We were able to get an interactive map to
show up on a webpage, with the map centered at our current location.
However, we were unable to place a marker for our location working
correctly while using this library, which would be helpful for
easily scanning a map to find study locations. So we may have to
do some further experimentation with other Google Maps React
libraries to try and get the desired behavior. However, overall,
this experiment appears to have been successful.  

## Experiment 2

This experiment was about understanding the Google Places API that
is going to be used in order to source out the initial data for our
app. One of the app's major concerns is its ability to have suitable
data for the initial users. While the app's true benefit comes from
the study places the users of the app register for other users to
benefit from, the google places API can be user to provide users
suitable places to study initially.

For this experiment, we tried the various available google places API
endpoints through a simple Phoenix web app. We set up the auth key
required to make requests and experiment with the results from the
endpoints place/findplacefromtext, place/nearbysearch, and
place/textsearch. We also experimented with the various optional
parameters, which may help fine-tune our results to places suitable
to study. One of the major difficulties we faced involved
understanding what it meant for a place to be suitable for "studying"
and how we could communicate that to the API so that it returned
the most relevant results. Finally, we decided that the
place/nearbysearch endpoint with the "type" query would suit our
needs best. Certain categories of places such as cafes and libraries
are known to have a stable wifi connection, outlets, and seating,
making them ideal for studying. Hence, by using the predefined types
of Cafe and Library, we are able to make requests to the API for the
nearest suitable study places. The HTML Geolocation API becomes
crucial in allowing us to identify the user's location so that we
can provide the user with the most relevant results. Hence, our small
web-app, capable of retrieving and displaying the names of all cafes
and libraries in Boston, convinces us that this feature is
implementable.

## What kinds of users do you expect to have use your app?
  We expect that our app would be widely used by college aged
students. As a global pandemic has made finding a quiet and safe
place to study a difficult task. Our app not only has destinations
to study, but also a live count on the amount of people in a given
study area. This will allow students who are looking for a more
secluded place the opportunity to find one close to them. We believe
that these features could be used primarily by college age students,
but also possibly high school aged students and remote workers.
  This app is intended to be super user friendly allowing a wide
range of users to access its capabilities. A simple phone search
on Google will allow varying age groups to access information
on study spaces in their area. The coolest part is that remote
workers can check their favorite coffee shops and libraries
to see their current capacities. This allows even more than
just college age users to enjoy this app even though students
would be our primary target. This app will help college students
be responsible and productive during a global pandemic.

## For each kind of users, what is their most common workflow / user story?
  A typical user would first encounter a login page. After logging in, the
see a geo-map which includes study sites located in their area. A user
would then be able to interact with a location and see various attributes.
These attributes would include a current count of the amount of people
at the study location, a rating, and comments. A user would be allowed
to rate the location, add a comment, or update the capacity number of
the study location. Users will also be able to add new study locations
to the app.
  Nick has a long day of classes and needs to find a nice quiet spot to
finish up some homework. He goes to his room but finds his roommate is
listening to loud music. He decides to login Go-Study with his username
and password. Nick sees that his closest option is the Curry student
center. Unfortunately, there are fifteen students actively studying
there so he decides against it due to capacity concerns.
Nick also sees that ISEC only a few extra minute walk currently only
has five people studying right now. He also sees that ISEC has a 4.4
out of 5 star rating coinciding  with many supportive comments.
One comment reads "ISEC offers a large space with many outlets and
tables to accommodate your studying needs." Nick then makes his
way to ISEC and finds only 3 people still studying. He updates
the app with the current population. After peacefully  completing his
homework, he adds a five star review and a comment. The comment
reads, "ISEC is a modern and resourceful study space that everyone
should definitely add to their list of favorite study spots,
but only when I'm not there ;)"
