.PHONY: all run

PROGRAMS = euclid_c euclid_rs euclid_go euclid_c_fast euclid_rs_fast euclid_py

all: ${PROGRAMS}

bench: all
	@echo "euclid_c"
	@sh -c 'time for i in `seq 1000`; do ./euclid_c > /dev/null; done'
	@echo "euclid_c_fast"
	@sh -c 'time for i in `seq 1000`; do ./euclid_c_fast > /dev/null; done'
	@echo "euclid_rs"
	@sh -c 'time for i in `seq 1000`; do ./euclid_rs > /dev/null; done'
	@echo "euclid_rs_fast"
	@sh -c 'time for i in `seq 1000`; do ./euclid_rs_fast > /dev/null; done'
	@echo "euclid_go"
	@sh -c 'time for i in `seq 1000`; do ./euclid_go > /dev/null; done'


euclid_c_fast: euclid.c
	clang $^ -o $@ -Ofast

euclid_c: euclid.c
	clang $^ -o $@

euclid_rs_fast: euclid.rs
	rustc $^ -o $@ -O

euclid_rs: euclid.rs
	rustc $^ -o $@

euclid_go: euclid.go
	go build $^
	@mv euclid $@

euclid_py: euclid.py
	@echo "#!/usr/bin/env sh" > $@ 
	@echo "python3 euclid.py" >> $@
	@chmod +x $@

clean:
	rm ${PROGRAMS}
