number: number.hs
	ghc --make number.hs

test: number
	stdiochk -n ./number testdata

clean:
	rm -f number number.o number.hi

.PHONY: test clean
