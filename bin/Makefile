MKLIB=ocamlmklib
OCAMLOPT=ocamlopt
OCAMLC=ocamlc

# Set this to -p for profiler support
PROFILE=

PROGS=rails_queue remove_all enqueue_lots

.SUFFIXES: .ml .mli .cmi .cmx

all: $(PROGS)

rails_queue: rails_queue.ml
	$(OCAMLOPT) $(PROFILE) -o $@ -I ../src \
		unix.cmxa beanstalk.cmxa rails_queue.ml

remove_all: remove_all.ml
	$(OCAMLOPT) $(PROFILE) -o $@ -I ../src \
		unix.cmxa beanstalk.cmxa remove_all.ml

enqueue_lots: enqueue_lots.ml
	$(OCAMLOPT) $(PROFILE) -o $@ -I ../src \
		unix.cmxa beanstalk.cmxa enqueue_lots.ml

clean:
	rm -f *.a *.cma *.cmxa *.cmx *.mli *.cmi *.cmo *.o
	rm -f $(PROGS)

.ml.mli:
	$(OCAMLOPT) -o .buildtmp -i $< > $@
	rm .buildtmp

.ml.cmi:
	$(MKLIB) $<
