FROM ruby:3.1-bullseye

WORKDIR /workspace/src

COPY src/Gemfile Gemfile
COPY src/Gemfile.lock Gemfile.lock

RUN apt-get update \
    && apt-get upgrade -y \
    && rm -rf /var/lib/apt/lists/* \
    && bundle install

COPY entrypoint.sh /usr/bin/
RUN chmod +x /usr/bin/entrypoint.sh
ENTRYPOINT ["entrypoint.sh"]
EXPOSE 3000

CMD ["rails", "server", "-b", "0.0.0.0"]
