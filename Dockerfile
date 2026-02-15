FROM ghcr.io/getzola/zola:v0.17.1 AS zola

ARG ISSO_URL
ENV ISSO_URL=$ISSO_URL
COPY . /project
WORKDIR /project
RUN ["zola", "build"]

FROM ghcr.io/static-web-server/static-web-server:2-debian
WORKDIR /
COPY --from=zola /project/public /public