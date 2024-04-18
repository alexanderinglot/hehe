# Użyj oficjalnego obrazu OpenJDK jako podstawy
FROM openjdk:17-jdk-alpine AS builder

# Ustaw katalog roboczy
WORKDIR /app

# Skopiuj plik pom.xml i src do katalogu roboczego
COPY pom.xml .
COPY src ./src

# Skopiuj plik Maven Wrapper do katalogu roboczego
COPY mvnw .
COPY .mvn .mvn

# Zmień uprawnienia pliku Maven Wrapper
RUN chmod +x mvnw

# Zbuduj aplikację bez testów za pomocą Maven Wrappera
RUN ./mvnw package -DskipTests

# Utwórz ostateczny obraz z plikiem JAR
FROM openjdk:17-jdk-alpine
WORKDIR /app
COPY --from=builder /app/target/demo-0.0.1-SNAPSHOT.jar app.jar
ENTRYPOINT ["java", "-jar", "app.jar"]
