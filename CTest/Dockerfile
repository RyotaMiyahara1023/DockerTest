FROM gcc:12.2

RUN apt-get update && apt-get install -y diffutils sed && apt-get clean

WORKDIR /app

COPY main.c .
COPY input.txt .
COPY output.txt .

RUN gcc -o main main.c

CMD bash -c "\
  ./main < input.txt > tmp_output.txt 2>/dev/null; \
  ret=\$?; \
  if [ \$ret -ne 0 ]; then \
    echo 'RE'; \
    exit \$ret; \
  fi; \
  sed -i 's/\r$//' tmp_output.txt; \
  sed -i 's/\r$//' output.txt; \
  if diff -q output.txt tmp_output.txt > /dev/null; then \
    echo 'AC'; \
  else \
    echo 'WA'; \
  fi"