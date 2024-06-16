FROM krakend/krakend-ee:2.6 AS builder

RUN mkdir -p /etc/krakend/settings /etc/krakend/templates
# Скопировать все файлы в директорию /etc/krakend
COPY . /etc/krakend/
# Проверить конфигурацию
RUN FC_ENABLE=1 \
    FC_SETTINGS="/etc/krakend/settings" \
    FC_TEMPLATES="/etc/krakend/templates" \
    krakend check -t -d -c /etc/krakend/sample.json

# Запуск Krakend с Flexible Configuration
RUN FC_DEBUG=true krakend check -d -t -c "krakend.json"
RUN krakend openapi export -c /tmp/krakend.json -o /tmp/openapi.json

# Redocly generation
FROM redocly/cli as redocly
COPY --from=builder /tmp/openapi.json /spec/swagger.json
# Outputs under /spec/redoc-static.html
RUN /usr/local/bin/redocly build-docs swagger.json

FROM krakend/krakend-ee:2.6 AS production
COPY krakend/LICENSE /etc/krakend/LICENSE
# Copy the final configuration and the documentation
# which will be served from KrakenD itself under /docs/
COPY --from=builder /tmp/krakend.json /etc/krakend/krakend.json
COPY --from=redocly /spec/redoc-static.html /etc/krakend/docs/index.htm

ENTRYPOINT ["sh", "-c", "FC_ENABLE=1 FC_SETTINGS=/etc/krakend/settings FC_TEMPLATES=/etc/krakend/templates krakend run -c /etc/krakend/sample.json"]
