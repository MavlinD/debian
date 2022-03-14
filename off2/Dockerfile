FROM geekidea/alpine-cron:3.10
# run as nobody
USER nobody
RUN mkdir /tmp/crontabs \
    && echo 'SHELL=/bin/sh' > /tmp/crontabs/nobody \
    && echo '* * * * * /tmp/nobody.sh' >> /tmp/crontabs/nobody \
    && echo 'echo "$(date) blahblahblah nobody" >> /tmp/nb-cron.log' > /tmp/nobody.sh \
    && chmod 0755 /tmp/nobody.sh
# run crond service as foreground mode
CMD ["crond", "-c", "/tmp/crontabs", "-l", "0", "-d", "0", "-f"]
