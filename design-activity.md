1)Design-activity:

** What classes does each implementation include? Are the lists the same?
-> class CarEntry, class ShoppingCart and class Order for both implementations.

** Write down a sentence to describe each class.
-> The class CartEntry is responsible for collecting a unit price and quantity of a item as "adding" it to a "virtual shopping cart". 

-> The class ShoppingCart is responsible for collecting a list of entries as the items inside the "virtual shopping cart". 

-> The class Order holds a instance of the class ShoppingCart. This class is responsible for calculating the subtotal and taxes of the items in the "virtual shopping cart" for implementation A, which is distributed between the other two classes for the implementation B. 

** How do the classes relate to each other? It might be helpful to draw a diagram on a whiteboard or piece of paper.
-> The class CartEntry collects an entry(item + quantity) that is stored in an array @entries initiated in the class ShoppingCart and the class Order created a new instance of the class ShoppingCart, calculates de price and/or taxes (implementation A or B).

** What data does each class store? How (if at all) does this differ between the two implementations?
-> The CartEntry contains the instance variables @unit_price and @quantity.
-> The ShoppingCart class contains the instance variable @entries.
-> The Order class contains @cart that creates a new instance of the ShoppingCart class.

** What methods does each class have? How (if at all) does this differ between the two implementations?
-> Implementation A:
Class CartEntry has only attr_acessor methods.
Class ShoppingCart has only a attr_acessor method.
Class Order has a total_price method.

-> Implementation B:
Class CartEntry has a method "price".
Class ShoppingCart has a method "price". 
Class Order has a method "total_price".

** Consider the Order#total_price method. In each implementation:
** Is logic to compute the price delegated to "lower level" classes like ShoppingCart and CartEntry, or is it retained in Order? The second on was delegated....
-> Implementation A - it's retained in the class Order
-> Implementation B -  it's delegated to other classes

** Does total_price directly manipulate the instance variables of other classes?
-> For the implementation A it does on the entries.each loop.

** If we decide items are cheaper if bought in bulk, how would this change the code? Which implementation is easier to modify? 
-> Implementation B where the discount could be implemented at the CartEntry Class directly.

** Which implementation better adheres to the single responsibility principle?
-> Implementation B.

** Bonus question once you've read Metz ch. 3: Which implementation is more loosely coupled?
-> Implementation B.

2) Based on the answers to each set of the above questions in each class of Hotel, identify one place in your Hotel project where a class takes on multiple roles, or directly modifies the attributes of another class. Describe what changes you would need to make to improve this design, and how the resulting design would be an improvement.

-> I think the class hotel_organizer takes to many roles: it lists all the rooms, lists available rooms by date, makes a reservation that uses the method list_available_rooms as a helper method, that itself uses another method room_available? as a helper method.

Make_reservation, list_available_rooms and room_available methods are tightly coupled together and I couldn't delegate one or more of those methods to another class like Room. 

