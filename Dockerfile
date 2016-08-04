FROM alpine:3.4

RUN ulimit -n 65536

RUN apk add --no-cache \
build-base \
ca-certificates \
ruby \
ruby-irb \
ruby-dev && \
rm -rf /var/cache/apk/* /tmp/* /var/tmp/*

RUN echo 'gem: --no-document' >> /etc/gemrc

RUN gem install fluentd -v "~> 0.14.0" --no-ri --no-rdoc && \
gem install fluent-plugin-elasticsearch --no-ri --no-rdoc

COPY fluent.conf /etc/fluent/fluent.conf

RUN fluentd --dry-run

EXPOSE 24220

ENTRYPOINT ["fluentd"]
