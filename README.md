The GSA Agile Delivery Services prototype can be accessed at: https://github.com/accelian/ads

Agile Development Methodology – Iterative Approach
Using an  agile development approach, Accelian developed developed several iterations of code before 
developing a minimum viable product (MVP). The MVP has now been released as a prototype for the GSA Agile Delivery Services 
request for proposal. Using only open-source and freely available software, the prototype accesses and retreives data from 
OpenFDA. The retreived data is then rendered into a visual reporting format that attempts to show the relationship between 
drug recalls and their associated adverse affects.

Team Construct

In keeping with an agile methodology, Accelian developed the prototype with a small team of highly skilled developers (2) 
and engineers (1) using new technology that allowed us to iterate quickly through functional development. A single point of 
contact, our lead architect (Terry Rice), was solely responsible for the delivery of the project. 

Technology 
Accelian created a RESTful 
service that accesses the openFDA API to retreive data. The data is then packaged as a JSON message and provided to the 
front-end for rendering. The front-end of the application uses D3.js templates for visualizing the data. All of the software
used in the development of the prototype is open-source: Java, Grails, D3.js, LESS, TwitterBootstrap, Jenkins, JUnit, Apache,
JBoss.

Testing, Continuous Integration, and Deployment
Accelian uses a Test Driven Development approach wherein all unit tests for code are developed prior to code being writen. 
The tests and code coverage reports are available in this git repository.
The prototype is delivered as a single .war file as a java container via Jenkins through continuous integration and deployment.
As code is checked in tests are automatically executed and (upon succesfully passing the tests) a build is created. This build 
can be deployed into any Java platform for execution. The prototype currently exists on Accelian's Amazon Web Services platform.
