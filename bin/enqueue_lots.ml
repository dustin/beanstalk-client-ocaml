(*
 * Copyright (c) 2007  Dustin Sallings <dustin@spy.net>
 *)

let rec job_queue bs =
  function 0 -> ()
    |  count ->
        ignore(Beanstalk.put bs 65535 0 3600 "some data");
      job_queue bs (count - 1)

let main () =
	let bs = Beanstalk.connect Sys.argv.(1) 11300 in
        job_queue bs (int_of_string Sys.argv.(2));
	Beanstalk.shutdown bs
;;

(* Start main unless we're interactive. *)
if !Sys.interactive then () else begin main() end

