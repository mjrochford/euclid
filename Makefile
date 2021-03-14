.PHONY: all run

PROGRAMS = euclid_c euclid_rs euclid_go euclid_c_fast euclid_rs_fast euclid_c_recursive euclid_py euclid_builtin_py euclid_js euclid_sh

all: ${PROGRAMS}

bench: all
	@./bench.sh "./euclid_c" 1000
	@./bench.sh "./euclid_c_fast" 1000
	@./bench.sh "./euclid_c_recursive" 1000
	@./bench.sh "./euclid_rs" 1000
	@./bench.sh "./euclid_rs_fast" 1000
	@./bench.sh "./euclid_go" 1000
	@./bench.sh "./euclid_py" 100
	@./bench.sh "./euclid_builtin_py" 100
	@./bench.sh "./euclid_js" 100
	@./bench.sh "./euclid_sh" 1000

euclid_c_recursive: euclid-recursive.c
	clang $^ -o $@

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
	@echo "python3 $^" >> $@
	@chmod +x $@

euclid_builtin_py: euclid-builtin.py
	@echo "#!/usr/bin/env sh" > $@ 
	@echo "python3 $^" >> $@
	@chmod +x $@

euclid_js: euclid.js
	@echo "#!/usr/bin/env sh" > $@ 
	@echo "node $^" >> $@
	@chmod +x $@

euclid_sh: euclid.sh
	@echo "#!/usr/bin/env sh" > $@ 
	@cat "euclid.sh" >> $@
	@chmod +x $@

clean:
	rm ${PROGRAMS}
