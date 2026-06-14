FROM alpine:3.19

# نصب پیش‌نیازها
RUN apk add --no-cache \
    curl \
    bash \
    ca-certificates \
    socat \
    tzdata \
    && ln -sf /usr/share/zoneinfo/Asia/Tehran /etc/localtime

# نصب X-UI
RUN curl -L https://github.com/alireza0/x-ui/releases/download/v3.0.2/x-ui-linux-amd64.tar.gz -o /tmp/x-ui.tar.gz \
    && tar -xzf /tmp/x-ui.tar.gz -C /usr/local/ \
    && rm /tmp/x-ui.tar.gz \
    && chmod +x /usr/local/x-ui/x-ui

# ایجاد دایرکتوری کانفیگ
RUN mkdir -p /etc/x-ui /var/log/x-ui

# کپی اسکریپت استارت
COPY start.sh /start.sh
RUN chmod +x /start.sh

# پورت‌های مورد نیاز
EXPOSE 54321 443 80 2096

CMD ["/start.sh"]
