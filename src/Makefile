MKLIB=ocamlmklib
OCAMLMKTOP=ocamlmktop
OCAMLOPT=ocamlopt
OCAMLC=ocamlc

PARTS=extstring.cmx beanstalk.cmx

.SUFFIXES: .ml .mli .cmi .cmx

.PHONY: $(PARTS)

all: libbeanstalk

libbeanstalk: $(PARTS)
	$(MKLIB) -o beanstalk beanstalk.cmo beanstalk.cmx
	rm -f libbeanstalk.a
	ln beanstalk.a libbeanstalk.a

clean:
	rm $(PARTS) beanstalk.cmxa beanstalk.cma *.cmi *.cmx *.a *.o *.cmo a.*

docs: $(PARTS)
	mkdir -p doc
	ocamldoc -t "Beanstalk Client Docs" -keep-code -colorize-code -d doc -html \
		*.mli *.ml

.mli.cmi: $<
	$(MKLIB) $< `echo $< | sed s/.mli/.ml/`

beanstalk.cmo: beanstalk.cmi
beanstalk.cmx: beanstalk.cmi
extstring.cmo: extstring.cmi
extstring.cmx: extstring.cmi
