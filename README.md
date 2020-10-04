# Terminal App Documentation

# **Software Development Plan**

## **Statement of Purpose**

With the recent and rapid spread of viruses like COVID, Ebola and Swine Flu, businesses need to be able to adapt quickly and easily to the new world. Sam's Terminal Ordering App will allow restaurants and bars to open their doors to customers and let them order without the need for human interaction. The reasons for developing this app are two-fold, firstly to learn in greater detail how the Ruby programming language functions, secondly to become a millionaire after graduating by selling this amazingly sophisticated application to every restaurant in the (possibly) post-apocalyptic world.

My target audience is broken into two different groups - employees (owners/managers of bars and restaurants) and customers who love going out for a meal and drinks, but hate getting Covid or other highly infectious diseases.

Sam's Terminal Ordering App will allow customers in restaurants and bars to order their food and drink without requiring waitstaff or a QR code. The restaurant or bar will be responsible for installing the app on each table. Once a group has sat down,the Ordering App will greet the customer with an artistic 'welcome' message to make them feel comfortable right from the start. Below the welcome message, a highly-customisable menu is displayed with the items available to order on the left, and the prices on the right. The customer is then prompted to input their order and quantity, for a larger group, the Ordering App can handle multiple orders without having to restart each time. Once the table has ordered everything they would like, a simple input of ‘done’ is all that is required to send their order to the kitchen. They are then rewarded for using the Ordering App by receiving a confirmation of their order together with the total price owed, an artistic ‘goodbye’ message, and a request for a quick survey of their experience. Management also receive the total amount of each order for cash-up at the end of the day, and the results of the survey, in a separate text file.

To clarify, the features of the app will include:

- A ‘welcome’ and ‘goodbye’ message using ASCII art,
- A loop to continue taking orders until all customers have finished, including quantities,
- A customisable menu and code to allow quick implementation for a large number of businesses,
- A receipt with the total calculated and printed,
- A survey that uses TTY prompt to simplify the experience (making it more likely for the customer to leave a review)
- Creating txt files for kitchen orders, total amounts, and survey results.

## **Features**

### **1. Welcome & Goodbye Art**

The Ordering App will display Ascii art which will be developed using the Ruby Gem ‘Artii’. Initially I was planning on using a simple ‘puts’ string, however, I didn’t like how messy it made my code look.  I corrected this by adding the art to a .txt file and called it using a block inside a method.

![Welcome code](./docs/welcome_code.png)

![Welcome ](./docs/welcome_image.png)

![Goodbye](./docs/bye_code.png)

### **2. Continue Taking Orders & Quantities Until Everyone Has Ordered**

The Ordering App will continue asking for orders until the customer has typed ‘done’. The app will first ask for you to enter what you would like to order, the output has specific instructions on how to do this. It will then verify that the restaurant has that item on the menu before asking how many they would like to order. If the input is a valid number it will add the item with its quantity to the order before asking you for the next item. Once you type ‘done’ the loop will break.

To address error handling, friendly instructions are given when the wrong input is received and the loop will start again.
![Loop code](./docs/loop_1.png)

![Loop image](./docs/loop_2.png)

![Loop error handling](./docs/loop_3.png)

### **3. A highly-customisable menu and code to allow quick implementation for a large number of businesses**

I will separate the code into classes to help quick installation over a variety of businesses. Menu, Restaurant, Order & MenuItem classes won’t require any change to the code. When installing the Ordering App in a new restaurant it will only take a minute or two to set-up by simply opening the main.rb file and changing the name of the restaurant, and replacing the items and prices in the ‘menu’. Your new restaurant is now ready to go!

![Menu 1](./docs/menu_1.png)

![Menu 2](./docs/menu_2.png)

![Menu code](./docs/menu_3.png)

### **4. Creating .txt files for kitchen orders, total amounts, and survey results**

.txt files will be created for the orders, cash sales, and survey. This will help management keep track of the daily sales and help me refine later versions with the feedback given in the survey. To do this for the total amount & survey I will define a method that utilises the ‘File’ class in Ruby and call it towards the end of the program. Orders and amount will go to the kitchen as soon as the customer orders the item.

![Sales & survey file code](./docs/txt_file_code.png)

![Sales & survey file](./docs/text_file_2.png)

![Kitchen code](./docs/kitchen_code.png)

![Kitchen items](./docs/kitchen_items.png)

### **5. Total calculated and printed on receipt**

The item price will be multiplied by the quantity and then added to the total.  The bill will then be printed-out once the user types '*done'.*

![Total order](./docs/order_total.png)

![Total code](./docs/total_code.png)

## **Outline of User Interaction & Experience**

There will be two different experiences depending on whether the user is a customer or an employee. 

### **Customer User**

The customer will be greeted with a feature welcome message, followed by a print-out of the menu available. They will find out how to interact with the app by following the simple instructions that prints-out underneath the menu. If the user follows the first instruction correctly, they will input their order into the command line and push ‘enter’. The same method is then applied to the quantity of the items desired. The customer will keep interacting with the loop feature until they complete their order. Once complete, the simple instructions make it clear to type ‘done’. This will clear the screen and print a receipt, with feature art created with a Ruby gem. The customer will then be asked to answer a one-question survey, which lists 4 options they can cycle through using the arrow keys.

If the customer ever types an invalid input they will receive a friendly message asking them to please try again. **This includes ordering ‘0’ of an item.**

The customer can then leave the restaurant and head to the bar on the corner, where they will interact with the app in the same way as the restaurant. Only the items to order and name showcased will be different.

### **Employee User**

An employee will be able to interact with customer orders, daily sales, and the survey answer by simply opening the .txt files in the app.

## **Control Flow Chart**

![Flowchart](./docs/flowchart.png)

## **Link to My Implementation Plan**

[Trello link](https://trello.com/b/GQvPB7Hp/terminal-ordering-app)

I regret not taking a screenshot when I first created my plan, but below is a screenshot of where I was up to with 5 days left until my deadline:


![Trello image](./docs/trello.png)

## **Instructions for Installation and Use**

- Once published, you can clone or download the Ordering-App from my [Github page](https://github.com/samhammond87/ruby-terminal-ordering-app)
- You will need ruby installed on your computer. You can download it by clicking this [link](https://www.ruby-lang.org/en/)
- The app utilises several gems, you will need the Bundler gem installed first. It should come installed with Ruby but you can also install it with the following input into your terminal: *gem install bundler*
- To install the gems, go to the src folder of the app on your terminal and use the command: *bundle install*
- Run the app from the same location with the bash script: *./run_app.sh*
- The app utilises simple technology that should run on all 21st Century computers and 
- **For more information about the app before running it type *ruby main.rb* followed by:**
    - **-a or -all ... list all commands**
    - **-h or -help ... show help**
    - **-v or -version ... show which version is installed**

### **Link to my slide deck for the W.I.P presentation as the videos won’t work in a pdf**

[LINK](https://www.canva.com/design/DAEJNnNKIL8/aaF75F60VgUJKEfFVg8fWg/view?utm_content=DAEJNnNKIL8&utm_campaign=designshare&utm_medium=link&utm_source=publishsharelink)

![Ppt screenshot of video](./docs/ppt_screenshot.png)