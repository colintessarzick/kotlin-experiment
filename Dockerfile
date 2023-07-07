FROM gradle:8.1.1-jdk17 AS builder
WORKDIR /output
COPY . .
RUN gradle bootJar

FROM amazoncorretto:17
WORKDIR /app
COPY --from=builder /output/build/libs/demo-*.jar demo.jar
ENTRYPOINT ["java", "-jar", "demo.jar"]
