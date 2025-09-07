# Introduction To Springboot

- think of springboot as a layer on top of spring that takes care of all the tedious setup for you
- it simplifies spring development by providing sensible defaults and ready-to-use features

## Getting Started

1. First, you need the latest version of the Java Development Kit (JDK)

[Java Downloads - Oracle](https://www.oracle.com/java/technologies/downloads/)

```bash
> java -version
> openjdk version "21.0.2" 2024-01-16  
> OpenJDK Runtime Environment (build 21.0.2+13-58)  
> OpenJDK 64-Bit Server VM (build 21.0.2+13-58, mixed mode, sharing)
```

2. Next, you need to install Maven Apache, which is a build automation tool used primarily for Java projects
[Apache Maven - Download](https://maven.apache.org/download.cgi)

```bash
> brew install maven
> mvn -version
> Apache Maven 3.9.5
```

3. Now, you can create a new Spring Boot project using the Spring Initializr
[Spring Initializr](https://start.spring.io/)
- Select the project metadata (Group, Artifact, Name, etc.)
- Choose the dependencies you need (e.g., Spring Web, Spring Data JPA, etc)
- Click on "Generate" to download the project as a ZIP file


## Project Structure

- /.idea
  -> misc.xml, modules.xml, workspace.xml
- /.mvn
  -> /wrapper
    -> maven-wrapper.jar, maven-wrapper.properties
