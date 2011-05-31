rpncalc: rpncalc.hs Stack.hs
	ghc --make rpncalc.hs

test: rpncalc
	stdiochk -n ./rpncalc testdata

clean:
	rm -f rpncalc rpncalc.o rpncalc.hi
	rm -f Stack.o Stack.hi

.PHONY: test clean
