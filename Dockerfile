FROM openjdk:8u282-slim-buster as node
COPY src/*.java /usr/src/
WORKDIR /usr/src
RUN javac -d . *.java
RUN echo Main-Class: Rectangulator > MANIFEST.MF
RUN jar -cvmf MANIFEST.MF rectangle.jar *.class
CMD ["java", "-jar", "/usr/src/rectangle.jar", "7", "9"]
