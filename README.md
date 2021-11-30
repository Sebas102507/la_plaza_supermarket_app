# La Plaza (Supermarket app)!

This is a project I have made using Flutter framework (Which allows me to have either an Android or IOS app), Firebase with its cloud firestore database (To store users email and userId), in this case  I used a small JSON provided by a REST service to show the products details.

![enter image description here](https://i.ibb.co/hFHS5cC/1.png)
## 1) Login and SignIn

In this case, I show two options to the users, first one is Login, which requests the user an email and password, then the app will authenticate the data provided and next, It will check if the user exists in the users collection as a Document and finally it will allow or deny the access to the home page.

For the SignIn process, the data requested to the user is the same as in the Login process, then it will check if the email exists (or not), next, it will create a new user with the information provided, and finally it will allow the access to the home page.







## 2) Home

In the home page, the user will see the Companies name, a searchBar, an the products available.

### Search Bar
The searchBar is a TextField Widget which allows to enter text from the keyboard, also it has tree Functions associated, the first one is about OnChanged, this track the current text in the searchBar, the second one is about onSummited, this will respond when the user taps on the enter or confirm button on the keyboard, this will update the current search and will show it below, and the last one is onTap, this will respond when the user taps on the searchBar. Besides, in this project is being saved the history of the past searches of the user and will allow the user to tap on one of it in order to make a new search.



### Display Search
Here the search is being diplayed, if there's any search, the app will display all of the products.


### Navigation Bar
With it, user can change between 4 pages (Inicio, Notificaciones, Mis pedidos, Configuración).
