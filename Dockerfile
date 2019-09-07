FROM elixir:1.9.0-alpine as build
RUN apk add --update build-base git npm
RUN mkdir /app
WORKDIR /app
RUN mix local.hex --force && \
    mix local.rebar --force
ENV MIX_ENV=prod
COPY mix.exs mix.lock ./
COPY config config
RUN mix deps.get
RUN mix deps.compile
COPY assets assets
RUN cd assets && npm install && npm run deploy
RUN mix phx.digest
COPY priv priv
COPY lib lib
RUN mix compile
COPY rel rel
RUN mix release

FROM alpine:3.9 AS app
RUN apk add --update bash openssl
RUN mkdir /app
WORKDIR /app
COPY --from=build /app/_build/prod/rel/kubernetes_phoenix ./
RUN chown -R nobody: /app
USER nobody
ENV HOME=/app
CMD ["bin/kubernetes_phoenix", "start"]