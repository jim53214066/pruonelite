FROM azul/zulu-openjdk:8-jre
RUN mkdir /app
RUN groupadd -r app && useradd -r -g app -d /app -s /sbin/nologin -c "Docker image user" app
COPY --chown=app:app target/epa.war /app/epa.war
EXPOSE 8080
USER app
ENTRYPOINT ["java", "-jar", "/app/epa.war"]
