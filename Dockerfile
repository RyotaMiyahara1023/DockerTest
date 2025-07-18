FROM python:3.11-slim

RUN apt-get update && apt-get install -y diffutils sed && apt-get clean

WORKDIR /app

COPY main.py .
COPY output.txt .

CMD bash -c "\
  cat > /tmp/input.txt && \
  python main.py < /tmp/input.txt > /tmp/tmp_output.txt 2>/tmp/tmp_error.txt; ret=\$?; \
  if [ \$ret -ne 0 ]; then \
    echo RE; exit \$ret; \
  fi; \
  sed -i 's/[[:space:]]*$//' /tmp/tmp_output.txt; \
  sed 's/[[:space:]]*$//' output.txt | diff -q - /tmp/tmp_output.txt > /dev/null && \
  echo AC || echo WA"