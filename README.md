# Home Test API

## Installation Versioning
- Java JDK 17
   - `java -version`
- Maven 3.9.14
   - `mvn -version`
- Docker

## Setup
1. Pull the docker image.
   - `docker pull automaticbytes/demo-app`

2. Run the image.
   - `docker run -p 3100:3100 automaticbytes/demo-app`

3. Ensure API is running.
   - http://localhost:3100/api

4. Run tests:
   - `mvn test`
   - for a clean run, use `mvn clean test`