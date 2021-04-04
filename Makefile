.PHONY: all run

COMPILED = euclid_c euclid_rs euclid_go euclid_zig euclid_hs
INTERPRETED = euclid_py euclid_builtin_py euclid_js euclid_sh
OPTIONS = euclid_c_fast euclid_rs_fast euclid_c_recursive 
ALL = ${COMPILED} ${INTERPRETED} ${OPTIONS}

ifndef programs
PROGRAMS = ${ALL}
else
PROGRAMS = ${programs}
endif

all: ${PROGRAMS}

N_ITERATIONS = 1000
bench: all
	@for prog in ${PROGRAMS}; do	\
		./bench.sh ./$$prog ${N_ITERATIONS};\
	done

euclid_hs: euclid.hs
	stack ghc -- -o $@ $^

euclid_zig: euclid.zig
	zig build-exe $^ -O ReleaseFast
	@mv euclid $@

euclid_c_recursive: euclid-recursive.c
	clang $^ -o $@

euclid_c_fast: euclid.c
	clang $^ -o $@ -Ofast

euclid_c: euclid.c
	clang $^ -o $@ -g

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
	rm -rf zig-cache ${ALL}
