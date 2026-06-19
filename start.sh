#!/bin/bash
echo "🚀 Starting X-UI on port ${PORT}..."

# تنظیم Redis اگر متغیر وجود داشته باشه
if [ -n "$REDIS_URL" ]; then
    echo "🔴 Redis detected: $REDIS_URL"
    # اینجا می‌تونی هر کاری که با Redis می‌خوای انجام بدی (مثلاً export به محیط یا ...)
fi

mkdir -p /etc/x-ui
cat > /etc/x-ui/config.json << EOF
{
  "webPort": ${PORT},
  "webBasePath": "/",
  "webListen": "0.0.0.0",
  "logLevel": "info"
}
EOF

cd /usr/local/x-ui
./x-ui
