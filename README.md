# Fursurance

<!-- PROJECT LOGO -->

<!-- TABLE OF CONTENTS -->

<details>
  <summary>Table of Contents</summary>
  <ul>
    <li>
      <a href="#about-the-project">About The Project</a>
  </ul>
  <ul>
    <li><a href="#technologies-used">Technologies Used</a></li>
  </ul>
  </li>
  <ul>
    <li><a href="#howitworks">How It Works</a></li>
  </ul>
  <ul>
    <li><a href="#contact">Contact</a></li>
  </ul>

  <ul>
    <li><a href="#acknowledgments">Acknowledgments</a></li>
  </ul>

</details>

<!-- ABOUT THE PROJECT -->

## About The Project

<p>Fursurance is a Dynamic Web Application that allows the user to perform the following operations.</p>
<ol>
  <li><strong><em>C</em></strong>reate - Create a new Quote in the database with the "Request a quote" Button</li>
  <br>
  <li><strong><em>R</em></strong>ead - View past quotes in the database</li>
  <br>

  <p>Fursurnace will allow the admin to perform </p>

  <li><strong><em>U</em></strong>pdate - Update Predefined Fields of a Quote in the database</li>
  <br>
  <li><strong><em>D</em></strong>elete - Remove Existing Quotes in the database</li>
</ol>
<!--[![Product Name Screen Shot][product-screenshot]](https://example.com) -->

<p align="right">(<a href="#top">back to top</a>)</p>

### Technologies Used

- [Spring Tools 4](https://spring.io/tools)
- [Gradle Build Tool](https://gradle.org/install/)
- [MAMP Free](https://www.mamp.info/en/mac/)
- [Apache Tomcat v8.5](https://tomcat.apache.org/)
- [MySQL](https://www.mysql.com/)
- [Atom Text Editor](https://atom.io/)
- [Bootstrap v5.1](https://getbootstrap.com)
- [Figma Wireframing](https://www.figma.com)
- [Trello](https://trello.com)

<p align="right">(<a href="#top">back to top</a>)</p>

## How It Works


<ol>
  <li>
    The Fursurance Dynamic Web App is Run on a Apache Tomahawk v8.5 server and launched through Spring Tool Suite 4
  </li>
  <li>
    Upon Launch we are brought to index Page reflected in <strong>/WEB-INF/index.jsp</strong>
  </li>
  </ol>
  <h3><strong>User</strong></h3>
  <ol>
  <li>
    <strong>Request a Quote</strong> navigates the user to <strong>quoterequest.html</strong> where the user is prompted for there pets info.
  </li>
  <ul>
    <li>All information for the requested quote is then retrieved by way of the SpringMVC provided <strong>getNewQuote.do</strong> RequestMapping found in the <strong>QuoteController.java</strong>
    </li>
    <li>The User is then shown three different quotes</li>

  </ul>
  <li>
    <strong>Account</strong> navigates to <strong>account.jsp</strong> where the user is displayed there account page, including there past qoutes.
  </li>
</ol>
<h3><strong>Admin</strong></h3>
<ol>
  <li><strong>Account</strong> navigates to <strong>account.jsp</strong> where the user is displayed Fthere account page, this will include a listing of all users and there qoutes.</li>
  <ul>
    <li> The user is then presented with the option of Updating or Deleting any of the displayed Quotes. Update Quotes! will take the user to an update quote page auto populated with information from the database by way of the SpringMVC provided <strong>updateQuote.do</strong> RequestMapping found in the
      <strong>QuoteController.java</strong> after submition of changes then the user is returned to the aforementioned index page at <strong>/WEB-INF/index.jsp</strong>
    </li>
    <li> Delete Quote! will remove the quote from the database by way of the SpringMVC provided <strong>deleteQuote.do</strong> RequestMapping found in the <strong>QuoteController.java</strong> and then the user is returned to the aforementioned
      index page at <strong>/WEB-INF/index.jsp</strong>
    </li>
  </ul>
</ol>

<p align="right">(<a href="#top">back to top</a>)</p>

## Contact

<strong>Developers on Project</strong>

<h4>Taylor Yockey</h4>

<ul>
  <li><a href="https://www.linkedin.com/in/tayloryockey/">LinkedIn</a></li>
  <li><a href="https://github.com/TaylorY1">Github</a></li>
  <li> E-mail: yockeyt139@gmail.com/li>
</ul>

<h4>Chase Schwatka</h4>

<ul>
  <li><a href="https://www.linkedin.com/in/chaseschwatka/">LinkedIn</a></li>
  <li><a href="https://github.com/cschwatka">Github</a></li>
  <li> E-mail: cschwatka@gmail.com</li>
</ul>

<h4>Daniel Kregstein</h4>

<ul>
  <!-- <li><a href="--">LinkedIn</a></li> -->
  <li><a href="https://github.com/Akregstein">Github</a></li>
  <li> E-mail: akregstein@hotmail.com</li>
</ul>

<h4>Anthony Butler</h4>

<ul>
  <li><a href="http://www.linkedin.com/in/anthony-tyler-butler">LinkedIn</a></li>
  <li><a href="https://github.com/anthonyb0824">Github</a></li>
  <li> E-mail: anthonybutler0824@gmail.com</li>
</ul>

Project Link: [Fursurance](https://github.com/acorneld/Fursurance)

<p align="right">(<a href="#top">back to top</a>)</p>

<!-- ACKNOWLEDGMENTS -->

## Acknowledgments

- [Film Query App Foundation](https://github.com/anthonyb0824/FilmQueryProject)
- [Film Query App Reference #1](https://github.com/Cagugu/FilmQueryProject)
- [Film Query App Reference #2](https://github.com/acorneld/FilmQueryProject)
- [Stack Overflow](https://stackoverflow.com/)
- [W3 Schools](https://www.w3schools.com/)
- [Github - othneildrew](https://github.com/othneildrew/Best-README-Template)

<p align="right">(<a href="#top">back to top</a>)</p>
