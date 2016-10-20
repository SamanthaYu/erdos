# erdos

#####Group 11

**Group Members** (alphabetical order according to last name):

Irene Abrea, Dawn Chandler, Heather Li, Paul Miiller, Samantha Yu

##Abstract/Introduction
Erdos is a web application that makes writing and reading mathematical expressions in an instant messaging application easier. This web app will use an API to translate plaintext into elegant formulae and equations. Erdos will have a regular user login, and possibly an administrator login for certain users to manage chat groups that they have created. Our web application will use an open API to turn plaintext into elegant mathematical expressions. We have narrowed our choices of API down to MathJax, AsciiMath, and KaTeX. 

Currently, there are a couple of other applications with a similar purpose:
TeX extension for Gmail: This is a basic plugin for gmail which turns turns plaintext into the corresponding mathematical symbols. However, it is only limited to emails and Gmail chat, and is not a standalone application.
MathIM: A simple web chat application with LaTeX integration. The user interface is poor, and there are no user accounts or features besides the basic chat room.
Gitter (Created by GitHub): A web chat application that support KaTeX and formats code. It is primarily designed for developers. It lacks buttons or any method for creating formula besides manually typing in the text symbols. As well, it requires a GitHub account. This, along with how difficult it is to insert formula, makes it not very user friendly. 
MathChat: An iOS app with a similar math focus. However, it does not seem to have any support for sending mathematical symbols over text chat, and rather is based on users sending images of written work. However, it does allow for those seeking help to connect with tutors/teachers. There is no web browser version. 

Our group is aware that there are other similar tools, such as the TeX extension for Gmail, Gitter, MathIM, and MathChat. However, we believe that our Erdos will be unique because it is a standalone web-based chat application, not targeted towards software developers, and will have a superior user interface.

Our application is intended to make it easy to chat with friends and peers about math problems, homework, or anything else that requires the use of mathematical notation. Anyone who has tried to use Messenger or another mainstream chat application for discussing math knows the difficulty of doing so in such applications. Without support for mathematical symbols, it is hard to effectively communicate with another user the steps for solving a problem, or, in more advanced math, the solution to a problem. Many will often resort to sending images of written math, which is slow, unprofessional, difficult to do on desktop, and requires a high quality camera. Our project will hope to solve these problems, by making a user friendly chat application with a math focus. Our application will allow users to easily send mathematical notation and formulas.

The target audience for our project is anyone who has a need to convey mathematical ideas or work to another user over the internet. This audience would primarily be students, teachers, or those working in a field which requires complex mathematics. 


##User Epics and Stories: 
###Main Features (Highest Priority)

We aim to have these features finished by the first iteration.

* Accounts
  * I am a student/programmer/mathematician/teacher/etc. and I need to frequently send messages pertaining to mathematics to others over the internet. Therefore, I want to create an account.
  * I want to create an account. I should be able to set my username (must be unique) and password.
  * I already have an account, so I want to login.
* Chat Room
  * I need to quickly help my friend with homework. Therefore, I want to quickly create a chat room and send the link to my friend. I don’t want to make an account. 
  * I want to chat with n other users with n being a whole number.
  * I want options to have my chat room with unrestricted or restricted access.
* Chat
   * I want to be able to send basic text messages to my chat partners, and have plaintext math in my message transformed into the corresponding mathematical notation.

### Secondary Features
  * Friends and teacher/student roles
    * I have an account and a friend/coworker/etc. that also has an account. I want to add this other person as a friend and be able to invite them to a specific chatroom.
    * I’ve created a chat room, and want to invite some classmates/coworkers who do not have an account. Therefore, I want to be able to easily send the chat room link to them in a Facebook message using the Facebook Messenger Platform API.
    * I want to customize my account.
    * I want to be able to set a profile picture for my account.
    * I want to associate an email with my account.
    * I should be able to recover/change my password if I do forget it.
  * Customize Display
    * My computer has the technical specifications of a toaster. I want options to speed up rendering speed depending on my browser.
    * Users can define macros to use throughout the chat rooms.
  * Math Insertion
    * I don’t know what the plaintext math is for the formula/expression that I am thinking of. Therefore, I want to be able to input the formula/expression from a list of buttons.
    * I don’t know what the plaintext math is for the formula/expression that I am thinking of. Therefore, I want to be able to handwrite it on the screen and for the application to match it with the corresponding mathematical notation using MyScript.
  * Math calculations
    * I want to view the graph of the equation. Therefore, I want to be able to click on the message and be redirected to an online graphing calculator displaying the graph of the equation.
    * I want to know the result of the formula/expression that is in a message. I want to be able to click on the message, and get the answer by either being linked to Symbolab with the solution or for the answer to be displayed in place of the original message text.
  * Additional chat features
    * I have a picture of my work/solution for a math problem. I want to be able to send this picture as a message to other users.
    * I want to be annoying. Therefore, I want to be able to send emojis and stickers.
  
### Bigger Features:
* Tutoring service
  * I need help with math. I want to be able to enter a queue, and then be paired up with the next available tutor. I also want to be able to specify what specific mathematical subject I need help with, so I can be paired up with an appropriate mentor.
  * I like helping people, and might want to fulfil service hours for high school or have something for a resume. I want to register as a tutor. I should be able to specify what mathematical subjects I am familiar with, so that I can be paired up with students who are seeking help in those subjects. I should then be able to enter a queue, and then matched up with the next student seeking assistance.
* Whiteboard
  * I find it easier to explain my work or ideas when I’m able to show someone else my writing. Therefore, I want a feature that would allow me to have a shareable and interactive “whiteboard” displayed alongside the chat, which users can write on. I should be able to restrict the users in the chatroom who can draw on the whiteboard.
