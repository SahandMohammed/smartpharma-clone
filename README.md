# SmartPharma Application

SmartPharma is a comprehensive pharmacy management system designed to streamline the process of managing drug inventories, customer orders, and administrative tasks.

## Prerequisites

Before you begin, ensure you have met the following requirements:
- Java JDK 11 or higher installed
- IntelliJ IDEA (Community or Ultimate Edition)
- MySQL Server (or any compatible SQL database)
- Maven (usually bundled with IntelliJ IDEA)

## Setup

### Database Configuration

1. Create a new MySQL database named `smartpharma`.
2. Import the SQL schema provided in the `sql` directory of this repository into your database.

### Application Configuration

1. Open `src/main/resources/application.properties`.
2. Modify the database URL, username, and password to match your MySQL configuration:

```properties
spring.datasource.url=jdbc:mysql://localhost:3306/smartpharma
spring.datasource.username=yourUsername
spring.datasource.password=yourPassword
```
## Running the Application in IntelliJ IDEA
1. Clone this repository to your local machine:
```
git clone https://github.com/yourusername/smartpharma.git
cd smartpharma
```
2. Open IntelliJ IDEA.
3. On the welcome screen, choose "Open" and select the project directory you just cloned.
4. Wait for IntelliJ to finish indexing and downloading dependencies.
5. Configure the JDK:
- Go to File > Project Structure > Project.
- Set the Project SDK to your JDK 11 (or newer) installation.
6. Run the application:
- use the run configuration dropdown in the upper-right corner of IntelliJ to run the application through tomcat.

