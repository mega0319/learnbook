## Welcome To LearnBook

created by Naz Khan and Usman Pervaiz

The goal of this project was to emulate facebook functionality using our skills in Rails.
This project consists of zero JavaScript as, at the time, we had not learned enough to confidently
implement it.

### Login Screen

![Alt text](./screenshots/login.png?raw=true "Login Screen")

Our LearnBook logo was created using Adobe Illustrator with the help of our good friend and colleague, Peter Chicarielli.

Our User log-in feature utilizes some simple validations to check for password length,
alphanumeric combinations, on top of bcrypt for password encryption and authentication.

### Landing Page

![Alt text](./screenshots/landing.png?raw=true "Landing Page")

The landing page is pretty simple but you can see the navbar up top which can guide
the user to their desired destination.

### Search

![Alt text](./screenshots/search.png?raw=true "Search")

There is a search bar right underneath to search for different users by first name, last name or both.

### Profile page

![Alt text](./screenshots/friend.png?raw=true "Profile Page")

This is what the profile page looks like. We are currently logged in as Peter Kim and we are friends with Naz Khan. Since we are friends, we can like and comment on posts, send a message, or unfriend him if we'd like. We wanted to implement a friend request feature, where a user can send a request to another user. The second user has to make the decision on whether or not he approves the request as such.

### New Request/Notifications

![Alt text](./screenshots/friend_req.png?raw=true "Notifications")

We also implemented a notifications feature that will let the user know, upon login about any pending matters. In this case we have a new message and a new friend request, which if we click takes us to this page where we can accept or decline this request from Usman.

### Message

![Alt text](./screenshots/message.png?raw=true "Messages")

This messaging feature is very barebones. It is more like e-mail than real-time chat as we are not utilizing websockets or any javascript. We did however, implement read-receipts.

### New post

![Alt text](./screenshots/newpost.png?raw=true "New Post")

When creating a new post, you can upload a picture. This feature is thanks to the ImageMagick
and Paperclip libraries. This library is used for profile pictures as well which you can upload update creating an account or editing your profile.

### Posts

![Alt text](./screenshots/comments.png?raw=true "Comments")

Here you can see what a typical post looks like

Just like facebook, we can like his posts and comment on it. We took the liberty to
add a feature that facebook does not have; the 'dislike' button. Likes are tracked on the backend, so a user can't like or dislike a post more than once. If a user clicks like, the next time he clicks, it will negate the like.
