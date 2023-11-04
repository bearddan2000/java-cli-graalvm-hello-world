FROM ivonet/graalvm

ENV APP Main

ENV MAIN_CLASS example.$APP

WORKDIR /workspace

RUN gu install native-image

WORKDIR /code

COPY bin/src/main/java .

RUN javac -cp . $(find . -type f -name "*.java")

RUN native-image $MAIN_CLASS $APP

CMD "./${APP}"